import csv


with open('study.tsv', 'w') as tsvfile:
    studyfile = csv.writer(tsvfile, delimiter='\t')
    with open('rawdata.tsv', 'r') as file:
        lines = file.readlines()[1:]
        for line in lines:
            rank, NCT_number, title, status, study_results, conditions, \
            interventions, gender, age, phase, enrollment,  study_type, \
            start_date, locations, url = line.split("\t")

            studyfile.writerow([rank, NCT_number, status, study_type, title, start_date, gender, enrollment])

with open('age.tsv', 'w') as tsvfile:
    agefile = csv.writer(tsvfile, delimiter='\t')
    with open('rawdata.tsv', 'r') as file:
        lines = file.readlines()[1:]
        for line in lines:
            rank, NCT_number, title, status, study_results, conditions, \
            interventions, gender, age, phase, enrollment,  study_type, \
            start_date, locations, url = line.split("\t")

            age_split = age.split('(', 1)
            if len(age_split) > 1:
                age_range = age_split[0]
                age_detail = age_split[1].split(')')[0]
            else:
                age_range = None
                age_detail = age_split[0]

            age_detail_split = age_detail.split(',')
            for detail in age_detail_split:
                if detail == "Child":
                    age_detail_child = "Child"
                    age_detail_adult = None
                    age_detail_older = None
                elif detail == "Adult":
                    age_detail_adult = "Adult"
                    age_detail_child = None
                    age_detail_older = None
                elif detail == "Older Adult":
                    age_detail_older = "Older Adult"
                    age_detail_adult = None
                    age_detail_child = None

            agefile.writerow([NCT_number, age_range, age_detail_child, age_detail_adult, age_detail_older])


with open('phase.tsv', 'w') as tsvfile:
    phasefile = csv.writer(tsvfile, delimiter='\t')
    with open('rawdata.tsv', 'r') as file:
        lines = file.readlines()[1:]
        for line in lines:
            rank, NCT_number, title, status, study_results, conditions, \
            interventions, gender, age, phase, enrollment, study_type, \
            start_date, locations, url = line.split("\t")

            phase_detail_split = phase.split('|')
            phase_detail = ''
            for detail in phase_detail_split:
                phase_detail += detail + '\t'

            phasefile.writerow([NCT_number, phase_detail])


with open('interventions.tsv', 'w') as tsvfile:
    interventionfile = csv.writer(tsvfile, delimiter='\t')
    with open('rawdata.tsv', 'r') as file:
        lines = file.readlines()[1:]
        for line in lines:
            rank, NCT_number, title, status, study_results, conditions, \
            interventions, gender, age, phase, enrollment, study_type, \
            start_date, locations, url = line.split("\t")

            intervention_detail_split = interventions.split('|')
            intervention_detail = ''
            for detail in intervention_detail_split:
                intervention_detail += detail + '\t'
        
            interventionfile.writerow([NCT_number, intervention_detail])

with open('conditions.tsv', 'w') as tsvfile:
    conditionfile = csv.writer(tsvfile, delimiter='\t')
    with open('rawdata.tsv', 'r') as file:
        lines = file.readlines()[1:]
        for line in lines:
            rank, NCT_number, title, status, study_results, conditions, \
            interventions, gender, age, phase, enrollment, study_type, \
            start_date, locations, url = line.split("\t")

            condition_detail_split = conditions.split('|')
            condition_detail = ''
            for detail in condition_detail_split:
                condition_detail += detail + '\t'

            conditionfile.writerow([NCT_number, condition_detail])

with open('sites.tsv', 'w') as tsvfile:
    sitesfile = csv.writer(tsvfile, delimiter='\t')
    with open('rawdata.tsv', 'r') as file:
        lines = file.readlines()[1:]
        for line in lines:
            rank, NCT_number, title, status, study_results, conditions, \
            interventions, gender, age, phase, enrollment, study_type, \
            start_date, locations, url = line.split("\t")

            sites_detail_split = locations.split('|')
            for detail in sites_detail_split:
                one_site = detail.split(',') 
                if len(one_site) == 4:
                    NCT_number = NCT_number
                    site_name = one_site[0]
                    site_city = one_site[1]
                    site_state = one_site[2]
                    site_country = one_site[3]
                elif len(one_site) == 3:
                    NCT_number = NCT_number
                    site_name = one_site[0]
                    site_city = None
                    site_state = one_site[1]
                    site_country = one_site[2]
                elif len(one_site) == 2:
                    NCT_number = NCT_number
                    site_name = one_site[0]
                    site_city = None
                    site_state = None
                    site_country = one_site[1]
                elif len(one_site) == 1:
                    NCT_number = NCT_number
                    site_name = one_site[0]
                    site_city = None
                    site_state = None
                    site_country = None
        
                sitesfile.writerow([NCT_number, site_name, site_city, site_state, site_country])

