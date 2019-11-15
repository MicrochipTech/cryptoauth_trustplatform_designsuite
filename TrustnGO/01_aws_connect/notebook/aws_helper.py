import os
import subprocess
import csv

aws_access_key_str = 'aws configure set aws_access_key_id'
aws_secret_key_str = 'aws configure set aws_secret_access_key'
aws_set_region_str = 'aws configure set region'
show_configure_str = 'aws configure list'

account_CSV = "AWS_test_account_credentials.csv"
home_path = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.realpath(__file__)))))
ACCOUNT_CREDENTIALS = os.path.join(home_path, 'docs', account_CSV)

def list_current_configuration():
    print(subprocess.check_output(show_configure_str,universal_newlines=True, shell=True))

def configure_aws_access_key(access_key_id):
            print("Setting aws access key...")
            subprocess.call(aws_access_key_str + ' ' + access_key_id, shell=True)
            print("Done\n")

def configure_aws_secret_access_key(secret_key_access):
            print("Setting aws secret access key...")
            subprocess.call(aws_secret_key_str + ' ' + secret_key_access, shell=True)
            print("Done\n")

def configure_aws_configure_region(region):
            print("Setting aws region...")
            subprocess.call(aws_set_region_str + ' ' + region, shell=True)
            print("Done\r\n")
            print(subprocess.check_output(show_configure_str,universal_newlines=True, shell=True))

def configure_aws_cli(selected_region):
    try:
        with open(ACCOUNT_CREDENTIALS, mode='r') as csv_file:
            csv_reader = csv.DictReader(csv_file)
            for row in csv_reader:
                access_key_id = row["Access key ID"]
                secret_key_access = row["Secret access key"]
                print("Setting aws access key...")
                subprocess.call(aws_access_key_str + ' ' + access_key_id, shell=True)
                print("Setting aws secret access key...")
                subprocess.call(aws_secret_key_str + ' ' + secret_key_access, shell=True)
                print("Setting aws region...\r\n")
                subprocess.call(aws_set_region_str + ' ' + selected_region, shell=True)
                print(subprocess.check_output(show_configure_str,universal_newlines=True, shell=True))
        return 'success'
    except:
        print("Verify account csv file existence and its content!")
        return 'danger'