import os
import subprocess
import csv

aws_access_key_str = 'aws configure set aws_access_key_id'
aws_secret_key_str = 'aws configure set aws_secret_access_key'
aws_set_region_str = 'aws configure set region'
show_configure_str = 'aws configure list'
rest_of_word_region = 'us-east-2'
china_region = 'cn-north-1'

rest_world_CSV = "AWS Test account credentials.csv"
china_CSV = "AWS China Test account credentials.csv"

home_path = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.realpath(__file__)))))
REST_OF_WORD_CREDENTIALS = os.path.join(home_path, 'Docs', rest_world_CSV)
CHINA_CREDENTIALS = os.path.join(home_path, 'Docs', china_CSV)

def configure_aws_rest_of_the_world():
    with open(REST_OF_WORD_CREDENTIALS, mode='r') as csv_file:
        csv_reader = csv.DictReader(csv_file)
        for row in csv_reader:
            access_key_id = row["Access key ID"]
            secret_key_access = row["Secret access key"]
            print("Setting aws access key...")
            subprocess.call(aws_access_key_str + ' ' + access_key_id, shell=True)
            print("Setting aws secret access key...")
            subprocess.call(aws_secret_key_str + ' ' + secret_key_access, shell=True)
            print("Setting aws region...\r\n")
            subprocess.call(aws_set_region_str + ' ' + rest_of_word_region, shell=True)
            print(subprocess.check_output(show_configure_str,universal_newlines=True, shell=True))

def configure_aws_china():
    with open(CHINA_CREDENTIALS, mode='r') as csv_file:
        csv_reader = csv.DictReader(csv_file)
        for row in csv_reader:
            access_key_id = row["Access key ID"]
            secret_key_access = row["Secret access key"]
            print("Setting aws access key...")
            subprocess.call(aws_access_key_str + ' ' + access_key_id, shell=True)
            print("Setting aws secret access key...")
            subprocess.call(aws_secret_key_str + ' ' + secret_key_access, shell=True)
            print("Setting aws region...\r\n")
            subprocess.call(aws_set_region_str + ' ' + china_region, shell=True)
            print(subprocess.check_output(show_configure_str,universal_newlines=True, shell=True))
