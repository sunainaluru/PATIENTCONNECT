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

            age_detail = age.split('(')
            studyfile.writerow([rank, NCT_number, title, status, age, age_detail])

with open('phase.tsv', 'w') as tsvfile:
    phasefile = csv.writer(tsvfile, delimiter='\t')
    with open('rawdata.tsv', 'r') as file:
        lines = file.readlines()[1:]
        for line in lines:
            rank, NCT_number, title, status, study_results, conditions, \
            interventions, gender, age, phases, enrollment,  study_type, \
            start_date, locations, url = line.split("\t")

            phasefile.writerow([NCT_number, phase])

