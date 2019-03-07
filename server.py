"""Flask server for Javascript assessment."""

from jinja2 import StrictUndefined

from flask import (Flask, render_template, redirect, request, flash,
                   session, jsonify)
from flask_debugtoolbar import DebugToolbarExtension
from model import (Study, Age, Phase, Condition, Site, PhaseXref, CondXref,
                    InterXref, Inter, SiteXref, connect_to_db, db)

import googlemaps, os, requests
from sqlalchemy import cast, String

app = Flask(__name__)

# Required to use Flask sessions and the debug toolbar
app.secret_key = "ABC"

# Normally, if you use an undefined variable in Jinja2, it fails
# silently. This is horrible. Fix this so that, instead, it raises an
# error.
app.jinja_env.undefined = StrictUndefined


@app.route("/")
def show_homepage():
    """Show the homepage page"""

    return render_template("homepage.html")

@app.route("/condition-match", methods=['POST'])
def condition_match():

    cond_search = request.form.get("search")
    cond_query = Condition.query.filter(Condition.cond_detail.ilike('%' + cond_search + '%')).order_by(Condition.cond_detail).all()

    return render_template("cond_match.html", cond_query=cond_query)

@app.route("/zipcode-match", methods=['POST'])
def zipcode_match():
    try:
        user_zipcode = str(request.form.get("zipcode"))
        distance = str(request.form.get("distance"))
        units = str(request.form.get("units"))

        gmaps = googlemaps.Client(os.environ.get('GOOGLE_KEY'))
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

    return render_template("zipcode_match.html", conds_dict = conds_dict, conds_sorted_list = conds_sorted_list)

@app.route('/conditions/<cond_id>')
def user_info(cond_id):

    current_cond = Condition.query.filter_by(cond_id=cond_id).options(db.joinedload('study')).all()

    studies_dict = []
    ages_dict = []
    phases_dict = []
    inters_dict = []
    conds_dict = []
    sites_dict = []

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

    return render_template("cond_info.html", cond_id=cond_id, studies_dict=studies_dict, 
        ages_dict=ages_dict, phases_dict=phases_dict, inters_dict=inters_dict, 
        conds_dict=conds_dict, sites_dict=sites_dict)



if __name__ == "__main__":

    # make sure templates, etc. are not cached in debug mode
    app.jinja_env.auto_reload = app.debug

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)
    app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False

    app.run(debug=False, host="0.0.0.0")
