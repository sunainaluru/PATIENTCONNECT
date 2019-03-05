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


@app.route("/", methods=['GET'])
def show_homepage():
    """Show the homepage page"""

    return render_template("homepage.html")

@app.route("/condition-match", methods=['POST'])
def condition_match():

    cond_search = request.form.get("search")
    cond_query = Condition.query.filter(Condition.cond_detail.ilike('%' + cond_search + '%')).all()

    return render_template("cond_match.html", cond_query=cond_query)

@app.route("/zipcode-match", methods=['GET'])
def zipcode_match():

    user_zipcode = str(request.form.get("zipcode"))
    distance = str(request.form.get("distance"))
    units = str(request.form.get("units"))
    
    gmaps = googlemaps.Client(os.environ.get('GOOGLE_KEY'))

    #GOTTA FIX THIS URL PARAMS REQUEST
    api_results = requests.get("https://www.zipcodeapi.com/rest/z2W6lPLrcKBPbIr6ZkHiuPi8pQEHNq6chIwfPNKxkobKSqjA3L3kMnBNGD9SVXa1/radius.json/77001/15/miles")

    api_results = api_results.json()

    zipcodes = []

    for result in api_results['zip_codes']:
        zipcodes.append(result['zip_code'])

    query_results = []

    for zipcode in zipcodes:
        conversion = gmaps.geocode(zipcode)

        try:
            converted_lat = str(int(conversion[0]['geometry']['location']['lat'])) 
            converted_lng = str(int(conversion[0]['geometry']['location']['lng'])) 
        except IndexError:
            pass

        query_results = Site.query.filter(cast(Site.site_lat, String()).ilike(converted_lat + '%')).all()#.filter(cast(Site.site_lat, String()).ilike('-95' + '%')).all()


    conds_dict = {}

    for site in query_results:
        for study in site.study:
            for conds in study.conditions:
                conds_dict[conds.cond_id] = conds.cond_detail

    return render_template("zipcode_match.html", conds_dict = conds_dict)

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
    # We have to set debug=True here, since it has to be True at the
    # point that we invoke the DebugToolbarExtension
    app.debug = True

    # make sure templates, etc. are not cached in debug mode
    app.jinja_env.auto_reload = app.debug

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)

    app.run(debug=True, host="0.0.0.0")
