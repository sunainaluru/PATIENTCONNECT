from model import (Study, Age, Phase, Condition, Site, Inter, connect_to_db, db)


from flask import (Flask, render_template, redirect, request, flash)

import os, requests

from sqlalchemy import cast, String


def condition_search(cond_search):
    
    cond_query = Condition.query.filter(Condition.cond_detail.ilike('%' + cond_search + '%')).order_by(Condition.cond_detail).all()
    if cond_query == []:
        flash("Please enter a valid condition. Or the condition entered doesn't exist in our database, sorry!")
        cond_query = "error"
        return cond_query
    else:
        return cond_query

def zipcode_search(user_zipcode, distance, units):
    try:
        ZIP_KEY = os.environ.get('ZIP_KEY')

        url = ("https://www.zipcodeapi.com/rest/" + ZIP_KEY + "/radius.json/" + user_zipcode + "/" + distance + "/" + units)
        api_results = requests.get(url).json()

        zipcodes = []
        for result in api_results['zip_codes']:
            zipcodes.append(result['zip_code'])
    except KeyError:

        flash("Please enter a zipcode within the USA, or double check your zipcode entry!")
        results = "error"
        return results

    query_results = []
    conds_dict = {}
    for zipcode in zipcodes:
        query_results = Site.query.filter(Site.site_zipcode.ilike('%' + zipcode + '%'), Site.site_country.ilike('%United%')).all()

        for site in query_results:
            for study in site.study:
                for conds in study.conditions:
                    conds_dict[conds.cond_id] = conds.cond_detail

    conds_sorted_list = sorted(conds_dict.values())
    results = []
    results.extend([conds_dict, conds_sorted_list]) 

    return results

def condition_id_search(cond_id):

    current_cond = Condition.query.filter_by(cond_id=cond_id).options(db.joinedload('study')).all()

    studies_dict, ages_dict, phases_dict, inters_dict, conds_dict, sites_dict= [], [], [], [], [], []

    for condition in current_cond:
        for study in condition.study:
            studies_dict.append(study.to_json())
            for ages in study.ages:
                ages_dict.append(ages.to_json())
            for phases in study.phases:
                phases_dict.append(phases.to_json())
            for inters in study.inters:             
                inters_dict.append(inters.to_json())
            for conds in study.conditions:
                conds_dict.append(conds.to_json())
            for sites in study.sites:
                sites_dict.append(sites.to_json())

    results = []
    results.extend([studies_dict, ages_dict, phases_dict, inters_dict, conds_dict, sites_dict])
    return results

if __name__ == "__main__":
    connect_to_db(app)


