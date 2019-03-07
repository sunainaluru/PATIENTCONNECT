"""Models and database functions for my personal project."""

from flask_sqlalchemy import SQLAlchemy

# This is the connection to the PostgreSQL database; we're getting this through
# the Flask-SQLAlchemy helper library. On this, we can find the `session`
# object, where we do most of our interactions (like committing, etc.)


db = SQLAlchemy()


##############################################################################
# Model definitions

class Study(db.Model):
    """Study Information"""

    __tablename__ = "study"


    index = db.Column(db.Integer, autoincrement=True)
    nct_number = db.Column(db.String(64), primary_key=True)
    status = db.Column(db.String(64), nullable=True)
    study_type = db.Column(db.String(64), nullable=True)
    title = db.Column(db.String(1000), nullable=True)
    start_date = db.Column(db.String(64), nullable=True)
    gender = db.Column(db.String(64), nullable=True)
    enrollment = db.Column(db.Integer, nullable=True)

    phases = db.relationship("Phase", secondary = "phasexref", backref = "study") 
    conditions = db.relationship("Condition", secondary = "condxref", backref = "study")
    inters = db.relationship("Inter", secondary="interxref", backref="study")
    ages = db.relationship("Age", backref="study") #Check with Ashley if this is right!
    sites = db.relationship("Site", secondary="sitexref", backref="study")

    def to_json(self):

        return{"nct_number":self.nct_number, "status":self.status, "study_type":self.study_type,
        "title":self.title, "start_date":self.start_date, "gender":self.gender, "enrollment":self.enrollment}

    def __repr__(self):

        return f"<Study index={self.index} NCT_number={self.nct_number} \
        status={self.status} study_type={self.study_type} \
        title={self.title} start_date={self.start_date} \
        gender={self.gender} enrollment={self.enrollment}>"



class Age(db.Model):
    """Age Information"""

    __tablename__ = "age"


    age_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    nct_number = db.Column(db.String(64), db.ForeignKey(Study.nct_number)) 
    age_range = db.Column(db.String(64), nullable=True)
    age_detail_child = db.Column(db.String(64), nullable=True)
    age_detail_adult = db.Column(db.String(64), nullable=True)
    age_detail_older = db.Column(db.String(64), nullable=True)

    def to_json(self):

        return {"age_range": self.age_range, "age_detail_child": self.age_detail_child, 
        "age_detail_adult": self.age_detail_adult, "age_detail_older": self.age_detail_adult}


    def __repr__(self):

        return f"<Age NCT_number={self.nct_number} age_range={self.age_range} \
        age_detail_child={self.age_detail_child} \
        age_detail_adult={self.age_detail_adult} age_detail_older={self.age_detail_older}>"


class Phase(db.Model):
    """Phase Information"""

    __tablename__ = "phase"


    phase_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    phase_detail = db.Column(db.String(64), unique=True, nullable=True)

    def to_json(self):
        return {"phase_detail": self.phase_detail}
    

    def __repr__(self):

        return f"<Phase phase_id={self.phase_id} phase_detail={self.phase_detail}>"

class PhaseXref(db.Model):

    __tablename__ = "phasexref"


    nct_phase_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    nct_number = db.Column(db.String(64), db.ForeignKey(Study.nct_number))
    phase_id = db.Column(db.Integer, db.ForeignKey(Phase.phase_id)) 
    

    def __repr__(self):

         return f"<PhaseXref NCT_phase_id = {nct_phase_id} NCT_number={self.nct_number} phase_id={self.phase_id}>"


class Condition(db.Model):
    """Condition Information"""

    __tablename__ = "condition"


    cond_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    cond_detail = db.Column(db.String(100), unique=True, nullable=True)
    cond_dict = {}

    def to_json(self):

        return {"cond_detail" : self.cond_detail}
    

    def __repr__(self):

        return f"<Condition cond_id={self.cond_id} condition_detail={self.cond_detail}>"

class CondXref(db.Model):

    __tablename__ = "condxref"


    nct_cond_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    nct_number = db.Column(db.String(64), db.ForeignKey(Study.nct_number))
    cond_id = db.Column(db.Integer, db.ForeignKey(Condition.cond_id)) 
    

    def __repr__(self):

         return f"<CondXref NCT_phase_id = {nct_cond_id} NCT_number={self.nct_number} cond_id={self.cond_id}>"


class Inter(db.Model):
    """Intervention Information"""

    __tablename__ = "inter"


    inter_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    inter_detail = db.Column(db.String(500), unique=True, nullable=True)
    
    def to_json(self):

        return {"inter_detail": self.inter_detail}

    def __repr__(self):

        return f"<Inter inter_id={self.inter_id} inter_detail={self.inter_detail}>"

class InterXref(db.Model):

    __tablename__ = "interxref"


    nct_inter_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    nct_number = db.Column(db.String(64), db.ForeignKey(Study.nct_number))
    inter_id = db.Column(db.Integer, db.ForeignKey(Inter.inter_id)) 
    

    def __repr__(self):

         return f"<InterXref NCT_inter_id = {nct_inter_id} NCT_number={self.nct_number} inter_id={self.inter_id}>"


class Site(db.Model):
    """Site Information"""

    __tablename__ = "site"

    site_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    site_name = db.Column(db.String(500), nullable=True)
    site_city = db.Column(db.String(500), nullable=True)
    site_state = db.Column(db.String(500), nullable=True)
    site_country = db.Column(db.String(500), nullable=True)
    site_address = db.Column(db.String(500), nullable=True)
    site_lat = db.Column(db.Float, nullable=True)
    site_lng = db.Column(db.Float, nullable=True)
    site_zipcode = db.Column(db.String(500), nullable=True)

    def to_json(self):
        
        return {"site_name": self.site_name, "site_city":self.site_city, 
        "site_state":self.site_state, "site_country":self.site_country,
        "site_lat":self.site_lat, "site_lng":self.site_lng, "site_address":self.site_address,
        "site_zipcode":self.site_zipcode}

    def __repr__(self):

        return f"<Site site_id={self.site_id} site_name={self.site_name} \
        site_city={self.site_city} site_state={self.site_state} site_country={self.site_country} \
        site_address={self.site_address} site_lat={self.site_lat} site_lng={self.site_lng}>"

class SiteXref(db.Model):

    __tablename__ = "sitexref"


    nct_site_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    nct_number = db.Column(db.String(64), db.ForeignKey(Study.nct_number))
    site_id = db.Column(db.Integer, db.ForeignKey(Site.site_id)) 
    

    def __repr__(self):

         return f"<SiteXref NCT_site_id = {nct_site_id} NCT_number={self.nct_number} site_id={self.site_id}>"

##############################################################################
# Helper functions
def connect_to_db(app):
    """Connect the database to our Flask app."""

    # Configure to use our PstgreSQL database
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///patientapp'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.app = app
    db.init_app(app)
    #app.config['SQLALCHEMY_ECHO'] = True


if __name__ == "__main__":
    # As a convenience, if we run this module interactively, it will leave
    # you in a state of being able to work with the database directly.

    from server import app 
    connect_to_db(app)
    print("Connected to DB.")