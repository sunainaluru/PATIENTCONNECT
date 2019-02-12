"""Utility file to seed trials database from ClinicalTrial.gov data in seeddata/"""

from sqlalchemy import func
from model import Study, Interventions, Phase, Condition, Site
from datetime import datetime as dt

from model import connect_to_db, db
from server import app

def load_study():
    """Load studies from u.studies into database."""

    print("Studies Table Added")

    age_range = age.split('(', 1)[0].split(')')[0]
    age_detail = age.split('(', 1)[1].split(')')[0]

    # Delete all rows in table, so if we need to run this a second time,
    # we won't be trying to add duplicate studies
    Study.query.delete()

    # Read rawdata file and insert data
    for row in open("data/study.tsv"):
        row = row.rstrip()

        user_id, age, gender, occupation, zipcode = row.split("|")

        user = User(user_id=user_id,
                    age=age,
                    zipcode=zipcode)

        # We need to add to the session or it won't ever be stored
        db.session.add(user)

    # Once we're done, we should commit our work
    db.session.commit()

def load_phase():
    """Load movies from u.item into database."""

    print("Movies Table Added")

    Movie.query.delete()

    phase = phase.split('|') #(returns a list)

    for row in open("seed_data/u.item"):
        row = row.rstrip()
        movie_id, movie_title, release_date ,  video_release_date  \
        ,imdb_url, unknown ,  action ,  adventure ,  animation  \
        ,childrens ,  comedy ,  crime ,  documentary , drama ,  fantasy  \
        ,film_noir ,  horror ,  musical ,  mystery ,  romance ,  scifi  \
        ,thriller ,  war ,  western  =  row.split("|")

        movie = Movie(movie_id = movie_id,
            title=movie_title[:(len(movie_title) - 7)],
            released_at = dt.strptime(release_date, "%d-%b-%Y"),
            imdb_url = imdb_url)

        db.session.add(movie)


    db.session.commit()


def load_ratings():
    """Load ratings from u.data into database."""

    print("Ratings")

    Rating.query.delete()

    for row in open("seed_data/u.data"):
        row  = row.rstrip()
        user_id, movie_id, score, timestamp = row.split("\t")

        rating = Rating(movie_id = movie_id,
                        user_id = user_id,
                        score = score)

        db.session.add(rating)

    db.session.commit()

def set_val_user_id():
    """Set value for the next user_id after seeding database"""

    # Get the Max user_id in the database
    result = db.session.query(func.max(User.user_id)).one()
    max_id = int(result[0])

    # Set the value for the next user_id to be max_id + 1
    query = "SELECT setval('users_user_id_seq', :new_id)"
    db.session.execute(query, {'new_id': max_id + 1})
    db.session.commit()


if __name__ == "__main__":
    connect_to_db(app)

    # In case tables haven't been created, create them
    db.create_all()

    # Import different types of data
    load_users()
    load_movies()
    load_ratings()
    set_val_user_id()