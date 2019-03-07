from jinja2 import StrictUndefined

from flask import (Flask, render_template, redirect, request, flash)

from flask_debugtoolbar import DebugToolbarExtension

from model import connect_to_db

from utils import condition_search, zipcode_search, condition_id_search



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
    cond_query = condition_search(cond_search)

    return render_template("cond_match.html", cond_query=cond_query)

@app.route("/zipcode-match", methods=['POST'])
def zipcode_match():

    user_zipcode = str(request.form.get("zipcode"))
    distance = str(request.form.get("distance"))
    units = str(request.form.get("units"))

    results = zipcode_search(user_zipcode, distance, units)
    conds_dict, conds_sorted_list = results

    return render_template("zipcode_match.html", conds_dict = conds_dict, conds_sorted_list = conds_sorted_list)

@app.route('/conditions/<cond_id>')
def user_info(cond_id):

    results = condition_id_search(cond_id)

    studies_dict, ages_dict, phases_dict, inters_dict, conds_dict, sites_dict = results

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
