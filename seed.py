"""Utility file to seed trials database from ClinicalTrial.gov data in seeddata/"""

from sqlalchemy import func
from model import Study, Age, Phase, Condition, Site, PhaseXref
from datetime import datetime as dt

from model import connect_to_db, db
from flask import Flask
#from server import app

def load_study():
    """Load studies from study.tsv into database."""

    print("Study Table Added")

    # Delete all rows in table, so if we need to run this a second time,
    # we won't be trying to add duplicate studies
    Study.query.delete()

    # Read rawdata file and insert data
    for row in open("data/study.tsv"):
        row = row.rstrip()

        index, NCT_number, status, study_type, title, start_date, gender, enrollment = row.split("\t")

        study = Study(index=index,
                    NCT_number=NCT_number,
                    status=status,
                    study_type=study_type,
                    title=title,
                    start_date=start_date,
                    gender=gender,
                    enrollment=enrollment)

        # We need to add to the session or it won't ever be stored
        db.session.add(study)

    # Once we're done, we should commit our work
    db.session.commit()

def load_age():
    """Load phases from u.studies into database."""

    print("Age Table Added")

    # Delete all rows in table, so if we need to run this a second time,
    # we won't be trying to add duplicate studies
    Age.query.delete()

    # Read rawdata file and insert data
    for row in open("data/age.tsv"):
        row = row.rstrip()

        NCT_number, age_range, age_detail_child, age_detail_adult, age_detail_older = row.split("\t")

        age = Age(NCT_number=NCT_number,
                    age_range=age_range,
                    age_detail_child=age_detail_child,
                    age_detail_adult=age_detail_adult,
                    age_detail_older=age_detail_older)

        # We need to add to the session or it won't ever be stored
        db.session.add(age)

    # Once we're done, we should commit our work
    db.session.commit()

def load_phase():
    """Load phases from u.studies into database."""

    print("Phase Table Added")

    # Delete all rows in table, so if we need to run this a second time,
    # we won't be trying to add duplicate studies
    Phase.query.delete()

    # Read rawdata file and insert data
    for row in open("data/phase.tsv"):
        row = row.rstrip()  

        NCT_number, phase_detail = row.split("\t", 1)
        phase_detail = phase_detail.strip('"')
        phase_detail = phase_detail.split("\t")


        print(NCT_number, phase_detail)

        for detail in phase_detail:
            detail_query = Phase.query.filter_by(phase_detail = detail).first()
            if detail_query == None:
                if len(detail) > 1:
                    phase = Phase(phase_detail=detail)

                # We need to add to the session or it won't ever be stored
                db.session.add(phase)

                # Once we're done, we should commit our work
                db.session.commit()

                print(detail)

                phasexref = PhaseXref(NCT_number=NCT_number, phase_id=phase.phase_id)

                db.session.add(phasexref)

    db.session.commit()



def load_intervention():
    """Load phases from u.studies into database."""

    print("Intervention Table Added")

    # Delete all rows in table, so if we need to run this a second time,
    # we won't be trying to add duplicate studies
    Inter.query.delete()

    # Read rawdata file and insert data
    for row in open("data/interventions.tsv"):
        row = row.rstrip()

        NCT_number, intervention_detail = row.split("\t")

        inter = Inter(NCT_number=NCT_number,
                    intervention_detail=intervention_detail)

        # We need to add to the session or it won't ever be stored
        db.session.add(inter)

    # Once we're done, we should commit our work
    db.session.commit()

def load_condition():
    """Load phases from u.studies into database."""

    print("Condition Table Added")

    # Delete all rows in table, so if we need to run this a second time,
    # we won't be trying to add duplicate studies
    Condition.query.delete()

    # Read rawdata file and insert data
    for row in open("data/conditions.tsv"):
        row = row.rstrip()

        NCT_number, condition_detail = row.split("\t")

        condition = Condition(NCT_number=NCT_number,
                    condition_detail=condition_detail)

        # We need to add to the session or it won't ever be stored
        db.session.add(condition)

    # Once we're done, we should commit our work
    db.session.commit()

def load_sites():
    """Load phases from u.studies into database."""

    print("Sites Table Added")

    # Delete all rows in table, so if we need to run this a second time,
    # we won't be trying to add duplicate studies
    Site.query.delete()

    # Read rawdata file and insert data
    for row in open("data/sites.tsv"):
        row = row.rstrip()

        NCT_number, site_name, site_city, site_state, site_country = row.split("\t")

        site = Site(NCT_number=NCT_number,
                    site_name=site_name,
                    site_city=site_city,
                    site_state=site_state,
                    site_country=site_country)

        # We need to add to the session or it won't ever be stored
        db.session.add(site)

    # Once we're done, we should commit our work
    db.session.commit()


# def set_val_user_id():
#     """Set value for the next user_id after seeding database"""

#     # Get the Max user_id in the database
#     result = db.session.query(func.max(User.user_id)).one()
#     max_id = int(result[0])

#     # Set the value for the next user_id to be max_id + 1
#     query = "SELECT setval('users_user_id_seq', :new_id)"
#     db.session.execute(query, {'new_id': max_id + 1})
#     db.session.commit()


if __name__ == "__main__":
    app = Flask(__name__) #Take this out once server.py is made
    connect_to_db(app)

    # In case tables haven't been created, create them
    db.create_all()

    # Import different types of data
    load_study()
    # load_age()
    load_phase()
    # load_sites()
    # load_condition()
    # load_intervention()
    #set_val_user_id()