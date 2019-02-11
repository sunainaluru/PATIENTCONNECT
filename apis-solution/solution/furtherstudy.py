from pprint import pformat
import os

import requests
from flask import Flask, render_template, request, flash, redirect
from flask_debugtoolbar import DebugToolbarExtension

app = Flask(__name__)
app.secret_key = "SECRETSECRETSECRET"

EVENTBRITE_TOKEN = os.environ.get('EVENTBRITE_TOKEN')
EVENTBRITE_KEY = os.environ.get('EVENTBRITE_KEY')
EVENTBRITE_SECRET = os.environ.get('EVENTBRITE_SECRET')

EVENTBRITE_URL = "https://www.eventbriteapi.com/v3/"

USER_ID = "Your-User-Id-Here"

@app.route("/")
def homepage():
    """Show homepage."""

    return render_template("homepage.html")


@app.route("/afterparty-search")
def show_afterparty_form():
    """Show afterparty finding form"""

    return render_template("afterparty-search.html")


@app.route("/afterparties")
def find_afterparties():
    """Search for afterparties on Eventbrite"""

    query = request.args.get('query')
    location = request.args.get('location')
    distance = request.args.get('distance')
    measurement = request.args.get('measurement')
    sort = request.args.get('sort')

    # If the required information is in the request, look for afterparties
    if location and distance and measurement:

        # The Eventbrite API requires the location.within value to have the
        # distance measurement as well
        distance = distance + measurement

        payload = {'q': query,
                   'location.address': location,
                   'location.within': distance,
                   'sort_by': sort,
                   }

        # For GET requests to Eventbrite's API, the token could also be sent as a
        # URL parameter with the key 'token'
        headers = {'Authorization': 'Bearer ' + EVENTBRITE_TOKEN}

        response = requests.get(EVENTBRITE_URL + "events/search/",
                                params=payload,
                                headers=headers)
        data = response.json()

        # If the response was successful (with a status code of less than 400),
        # use the list of events from the returned JSON
        if response.ok:
            events = data['events']

        # If there was an error (status code between 400 and 600), use an empty list
        else:
            flash(f":( No parties:{data['error_description']}")
            events = []

        return render_template("afterparties.html",
                               data=pformat(data),
                               results=events)

    # If the required info isn't in the request, redirect to the search form
    else:
        flash("Please provide all the required information!")
        return redirect("/afterparty-search")


@app.route("/get-user-id", methods=['GET'])
def get_user_id():
    """Display user id from Eventbrite"""
    
    headers = {'Authorization': 'Bearer ' + EVENTBRITE_TOKEN}

    response = requests.get(EVENTBRITE_URL + "users/me/", headers=headers)
    data = response.json()

    return "Your USER_ID is {}".format(data['id'])


@app.route("/create-event", methods=['GET'])
def show_event_creation():
    """Show event creation page"""

    return render_template("event-creation.html")


@app.route("/create-event", methods=['POST'])
def create_eventbrite_event():
    """Create Eventbrite event using form data"""

    name = request.form.get('name')
    # The Eventbrite API requires the start & end times be in ISO8601 format
    # in the UTC time standard. Adding ':00' at the end represents the seconds,
    # and the 'Z' is the zone designator for the zero UTC offset.
    start_time = request.form.get('start-time') + ':00Z'
    end_time = request.form.get('end-time') + ':00Z'
    timezone = request.form.get('timezone')
    currency = request.form.get('currency')

    payload = {'event.name.html': name,
               'event.start.utc': start_time,
               'event.start.timezone': timezone,
               'event.end.utc': end_time,
               'event.end.timezone': timezone,
               'event.currency': currency,
               }

    # The token can't be sent as part of the payload for POST requests to
    # Eventbrite's API and must be sent as part of the header instead
    headers = {'Authorization': 'Bearer ' + EVENTBRITE_TOKEN}

    response = requests.post(EVENTBRITE_URL + "organizations/{}/events/".format(USER_ID),
                             data=payload,
                             headers=headers)
    data = response.json()

    # If the response was successful, redirect to the homepage
    # and flash a success message
    if response.ok:
        flash(f"Your event was created! Here's the link: {data['url']}")
        return redirect("/")

    # If the response was an error, redirect to the event creation page
    # and flash a message with the error description from the returned JSON
    else:
        flash(f"Error: {data['error_description']}")
        return redirect("/create-event")


############ Further Study ############

@app.route("/my-events")
def show_my_events():
    """Show a list of this app/user's Eventbrite events"""

    headers = {'Authorization': 'Bearer ' + EVENTBRITE_TOKEN}

    response = requests.get(EVENTBRITE_URL + "users/me/events/",
                            headers=headers)
    data = response.json()

    # If the response was successful (with a status code of less than 400),
    # use the list of events from the returned JSON
    if response.ok:
        events = data['events']

    # If there was an error (status code between 400 and 600), use an empty list
    else:
        flash(f"Error: {data['error_description']}")
        events = []

    # Create a dictionary of the events with ids as keys and names as values
    events_dict = {}
    for event in events:
        event_id = event['id']
        event_name = event['name']['text']
        events_dict[event_id] = event_name

    return render_template("my-events.html",
                           events=events_dict,
                           data=pformat(data))


############ Further Further Study ############

@app.route("/register")
def show_eventbrite_registration():
    """Redirect user to Eventbrite's Approve/Deny page"""

    return redirect("https://www.eventbrite.com/oauth/authorize"
                    + "?response_type=code"
                    + "&client_id=" + EVENTBRITE_KEY)


@app.route("/oauth")
def oauth_process():
    """Add bookmark for this event using OAuth"""

    code = request.args.get('code')

    # If Eventbrite returns an access code, use it to get an access token
    # for the user and then add a bookmark for an event
    if code:
        access_token = get_access_token(code)

        if access_token:
            add_bookmark(access_token, '35827931307')

    # If there is no access code, flash an error message
    else:
        flash('OAuth failed')

    return redirect('/')


######### Helper Functions #########
def get_access_token(code):
    """Use access code to request user's access token"""

    payload = {'code': code,
               'client_secret': EVENTBRITE_SECRET,
               'client_id': EVENTBRITE_KEY,
               'grant_type': 'authorization_code',
               }

    response = requests.post("https://www.eventbrite.com/oauth/token",
                             data=payload)
    json = response.json()

    # If the response was successful, use the access token from the returned JSON
    if response.ok:
        access_token = json['access_token']

    # If there was an error, use None as the access token and
    # flash a message
    else:
        access_token = None
        flash(f'OAuth failed: {json["error_description"]}')

    return access_token


def add_bookmark(access_token, event_id):
    """Use user's access token to save bookmark for event"""

    payload = {'event_id': event_id}
    headers = {'Authorization': 'Bearer ' + access_token}

    response = requests.post(EVENTBRITE_URL + "users/me/bookmarks/save/",
                             data=payload,
                             headers=headers)
    json = response.json()

    # If the response was successful and returned JSON has the value True
    # for the 'created' key
    if response.ok and json['created']:
        flash(f'Bookmark saved! https://www.eventbrite.com/e/{event_id}')
    else:
        flash(f'Bookmark not saved: {json["error_description"]}')


if __name__ == "__main__":
    app.debug = True
    app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False
    DebugToolbarExtension(app)
    app.run(host="0.0.0.0")
