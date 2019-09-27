import subprocess
import csv

aws_access_key_str = 'aws configure set aws_access_key_id'
aws_secret_key_str = 'aws configure set aws_secret_access_key'
aws_set_region_str = 'aws configure set region'
show_configure_str = 'aws configure list'



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
