"""Utility file to seed trials database from ClinicalTrial.gov data in seeddata/"""

from sqlalchemy import func
from model import Study, Age, Phase, Condition, Site, PhaseXref, CondXref, InterXref, Inter, SiteXref
from datetime import datetime as dt

from model import connect_to_db, db
from flask import Flask #delete this when you have server.py
#from server import app #uncomment this when you have server.py

def load_study():
    """Load studies from study.tsv into database."""

    # Delete all rows in table, so if we need to run this a second time,
    # we won't be trying to add duplicate studies
    Study.query.delete()

    # Read rawdata file and insert data
    for row in open("data/study.tsv"):
        row = row.rstrip()

        index, nct_number, status, study_type, title, start_date, gender, enrollment= row.split("\t")

        study = Study(index=index,
                    nct_number=nct_number,
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
    print("Study Table Added")


def load_age():
    """Load phases from u.studies into database."""

    # Delete all rows in table, so if we need to run this a second time,
    # we won't be trying to add duplicate studies
    Age.query.delete()

    # Read rawdata file and insert data
    for row in open("data/age.tsv"):
        row = row.rstrip()

        nct_number, age_range, age_detail_child, age_detail_adult, age_detail_older = row.split("\t")

        if age_detail_child == "null":
            age_detail_child = None
        if age_detail_adult == "null":
            age_detail_adult = None
        if age_detail_older == "null":
            age_detail_older = None

        age = Age(nct_number=nct_number,
                    age_range=age_range,
                    age_detail_child=age_detail_child,
                    age_detail_adult=age_detail_adult,
                    age_detail_older=age_detail_older)

        # We need to add to the session or it won't ever be stored
        db.session.add(age)

    # Once we're done, we should commit our work
    db.session.commit()
    print("Age Table Added")


def load_phase():
    """Load phases from u.studies into database."""

    # Delete all rows in table, so if we need to run this a second time,
    # we won't be trying to add duplicate studies
    Phase.query.delete()

    # Read rawdata file and insert data
    for row in open("data/phase.tsv"):
        row = row.rstrip()  

        nct_number, phase_detail = row.split("\t", 1)
        phase_detail = phase_detail.strip('"')
        phase_detail = phase_detail.split("\t")

        for detail in phase_detail:
            detail_query = Phase.query.filter_by(phase_detail = detail).first()
            study_query = Study.query.get(nct_number)
            if detail_query == None:
                if len(detail) > 1:
                    phase = Phase(phase_detail=detail)

                # We need to add to the session or it won't ever be stored
                study_query.phases.append(phase)
                db.session.add(phase)

                # Once we're done, we should commit our work
                db.session.commit()
    print("Phase Table Added")



def load_condition():
    """Load phases from u.studies into database."""

    # Delete all rows in table, so if we need to run this a second time,
    # we won't be trying to add duplicate studies
    Condition.query.delete()

    # Read rawdata file and insert data
    for row in open("data/conditions.tsv"):
        row = row.rstrip()

        nct_number, cond_detail = row.split("\t", 1)
        cond_detail = cond_detail.strip('"')
        cond_detail = cond_detail.split("\t")

        for detail in cond_detail:
            condition_query = Condition.query.filter_by(cond_detail = detail).first()
            study_query = Study.query.get(nct_number)
            if condition_query == None:
                if len(detail) > 1:
                    condition = Condition(cond_detail=detail)

                    # We need to add to the session or it won't ever be stored
                    study_query.conditions.append(condition)
                    db.session.add(condition)

                # Once we're done, we should commit our work
                db.session.commit()
    print("Condition Table Added")



def load_intervention():
    """Load phases from u.studies into database."""

    # Delete all rows in table, so if we need to run this a second time,
    # we won't be trying to add duplicate studies
    Inter.query.delete()

    # Read rawdata file and insert data
    for row in open("data/interventions.tsv"):
        row = row.rstrip()

        nct_number, inter_detail = row.split("\t", 1)
        inter_detail = inter_detail.strip('"')
        inter_detail = inter_detail.split("\t")

        for detail in inter_detail:
            inter_query = Inter.query.filter_by(inter_detail = detail).first()
            study_query = Study.query.get(nct_number)
            if inter_query == None:
                if len(detail) > 1:
                    inter = Inter(inter_detail=detail)

                    # We need to add to the session or it won't ever be stored
                    study_query.inters.append(inter)
                    db.session.add(inter)

                # Once we're done, we should commit our work
                db.session.commit()
    print("Interventions Table Added")



def load_sites():
    """Load phases from u.studies into database."""

    # Delete all rows in table, so if we need to run this a second time,
    # we won't be trying to add duplicate studies
    Site.query.delete()

    # Read rawdata file and insert data
    for row in open("data/sites.tsv"):
        row = row.rstrip()

        nct_number, site_name, site_city, site_state, site_country = row.split("|")

        if site_name =="null":
            site_name = None
        if site_city == "null":
            site_city = None
        if site_state == "null":
            site_state = None
        if site_country == "null":
            site_country = None

        study_query = Study.query.get(nct_number)
        site = Site(site_name=site_name,
                    site_city=site_city,
                    site_state=site_state,
                    site_country=site_country)

        # We need to add to the session or it won't ever be stored
        study_query.sites.append(site)
        db.session.add(site)

    # Once we're done, we should commit our work
    db.session.commit()
    print("Sites Table Added")


def clean_sites():

    koreasites = Site.query.filter_by(site_country = 'Republic of').all()
    for record in koreasites:
        site_country = site_state
        site_state = site_city
        site_city = null

    departmentname = Site.query.filter(Site.site_name.like = ('%department%')).all()
    for record in departmentname:
        site_name = site_city
        site_city = null

    cityfix = Site.query.filter(Site.site_city.like = ('%university%' | '%college%' 
        '%hospital%' | '%academy%' | '%center%' | '%centre%' | '%department%' \
        | '%trust%' | '%board%' | '%NHS%' | "p.o.")).all()
    for record in departmentname:
        if site_state == 'Cherkasy':
            site_city = null
        else:
            site_name = site_city
            site_city = null

    citynullfix = Site.query.filter(Site.site_city.like = ('%institution%' | \
        '%ambulancia%' | '%laboratory%' | '%surgery%' | '%llc%')).all()
    for record in citynullfix:
        site_city = null


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
    load_age()
    load_phase()
    load_condition()
    load_intervention()
    load_sites()
    clean_sites()
    
    #set_val_user_id()