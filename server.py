"""Flask server for Javascript assessment."""

from jinja2 import StrictUndefined

from flask import (Flask, render_template, redirect, request, flash,
                   session, jsonify)
from flask_debugtoolbar import DebugToolbarExtension
from model import (Study, Age, Phase, Condition, Site, PhaseXref, CondXref,
                    InterXref, Inter, SiteXref, connect_to_db, db)

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

@app.route('/conditions/<cond_id>')
def user_info(cond_id):

    current_cond = Condition.query.filter_by(cond_id = cond_id).options(db.joinedload('study')).all()

    return render_template("cond_info.html", current_cond=current_cond)

@app.route('/conditions/<cond_id>/address.json')
def create_address(cond_id):
    """JSON info address."""
    
    current_cond_2 = Condition.query.filter_by(cond_id = cond_id).options(db.joinedload('study')).all()
    address = ''
    address_dict = {}
    for cond in current_cond_2:
        for study in cond.study:
             for site in study.sites:
                if site.site_name == None:
                    site.site_name = ''
                if site.site_city == None:
                    site.site_city = ''
                if site.site_state == None:
                    site.site_state = ''
                address = site.site_name + ',' + site.site_city + ',' + site.site_state + ',' + site.site_country
                address_dict[site.site_name] = address

    return jsonify(address_dict)


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
