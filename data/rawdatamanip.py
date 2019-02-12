#Rank    NCT Number  Title   Status  Study Results   Conditions  Interventions   Gender  Age Phases  Enrollment  Study Type  Start Date  Locations   URL
import csv


with open('study.tsv', 'w') as tsvfile:
    studyfile = csv.writer(tsvfile, delimiter='\t')
    with open('rawdata.tsv', 'r') as file:
        lines = file.readlines()[1:]
        for line in lines:
            rank, NCT_number, title, status, study_results, conditions, \
            interventions, gender, age, phase, enrollment,  study_type, \
            start_date, locations, url = line.split("\t")
            studyfile.writerow([rank, NCT_number, status, study_type, title, start_date, age, gender, enrollment])

with open('phase.tsv', 'w') as tsvfile:
    phasefile = csv.writer(tsvfile, delimiter='\t')
    with open('rawdata.tsv', 'r') as file:
        lines = file.readlines()[1:]
        for line in lines:
            rank, NCT_number, title, status, study_results, conditions, \
            interventions, gender, age, phase, enrollment, study_type, \
            start_date, locations, url = line.split("\t")

            phasefile.writerow([NCT_number, phase])


with open('interventions.tsv', 'w') as tsvfile:
    interventionfile = csv.writer(tsvfile, delimiter='\t')
    with open('rawdata.tsv', 'r') as file:
        lines = file.readlines()[1:]
        for line in lines:
            rank, NCT_number, title, status, study_results, conditions, \
            interventions, gender, age, phase, enrollment, study_type, \
            start_date, locations, url = line.split("\t")

        
            interventionfile.writerow([NCT_number, interventions])

with open('interventions.tsv', 'w') as tsvfile:
    interventionfile = csv.writer(tsvfile, delimiter='\t')
    with open('rawdata.tsv', 'r') as file:
        lines = file.readlines()[1:]
        for line in lines:
            rank, NCT_number, title, status, study_results, conditions, \
            interventions, gender, age, phase, enrollment, study_type, \
            start_date, locations, url = line.split("\t")

        
            interventionfile.writerow([NCT_number, interventions])

with open('conditions.tsv', 'w') as tsvfile:
    conditionfile = csv.writer(tsvfile, delimiter='\t')
    with open('rawdata.tsv', 'r') as file:
        lines = file.readlines()[1:]
        for line in lines:
            rank, NCT_number, title, status, study_results, conditions, \
            interventions, gender, age, phase, enrollment, study_type, \
            start_date, locations, url = line.split("\t")

        
            conditionfile.writerow([NCT_number, conditions])

with open('sites.tsv', 'w') as tsvfile:
    sitesfile = csv.writer(tsvfile, delimiter='\t')
    with open('rawdata.tsv', 'r') as file:
        lines = file.readlines()[1:]
        for line in lines:
            rank, NCT_number, title, status, study_results, conditions, \
            interventions, gender, age, phase, enrollment, study_type, \
            start_date, locations, url = line.split("\t")

        
            sitesfile.writerow([NCT_number, locations])

