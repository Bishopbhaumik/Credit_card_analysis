import csv
from datetime import datetime

input_file = 'D:/power_bi_dataset/credit_card_dashboard/cc_add.csv'
output_file = 'D:/power_bi_dataset/credit_card_dashboard/cc_add_processed.csv'

with open(input_file, mode='r', newline='', encoding='utf-8') as infile, \
     open(output_file, mode='w', newline='', encoding='utf-8') as outfile:
    reader = csv.DictReader(infile)
    fieldnames = reader.fieldnames
    writer = csv.DictWriter(outfile, fieldnames=fieldnames)
    writer.writeheader()

    for row in reader:
        # Assuming 'date_column' is the name of your date column
        if row['Week_Start_Date']:
            try:
                # Convert 'DD-MM-YYYY' to 'YYYY-MM-DD'
                date_obj = datetime.strptime(row['Week_Start_Date'], '%d-%m-%Y')
                row['Week_Start_Date'] = date_obj.strftime('%Y-%m-%d')
            except ValueError:
                # Handle invalid date format
                row['Week_Start_Date'] = None
        writer.writerow(row)
