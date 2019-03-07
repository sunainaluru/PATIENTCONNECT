from model import (Study, Age, Phase, Condition, Site, Inter, connect_to_db, db)

import os, requests

from sqlalchemy import cast, String


def condition_search(cond_search):
    return Condition.query.filter(Condition.cond_detail.ilike('%' + cond_search + '%')).order_by(Condition.cond_detail).all()
    

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
        return redirect("/")

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


