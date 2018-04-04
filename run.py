import os
aws_access_key = os.environ.get('ACCESS_KEY')
aws_secret_key = os.environ.get('SECRET_KEY')
bucket_location = os.environ.get('BUCKET_LOCATION')
cron_schedule = os.environ.get('CRON_SCHEDULE')
source_path = os.environ.get('SOURCE_PATH')
destination_path = os.environ.get('DESTINATION_PATH')


# create dictionary of environment variables
env_dict = {}
env_dict['AWS_KEY'] = aws_access_key
env_dict['AWS_SECRET'] = aws_secret_key
env_dict['BUCKET_LOCATION'] = bucket_location
env_dict['CRON_SCHEDULE'] = cron_schedule
env_dict['SOURCE_PATH'] = source_path
env_dict['DESTINATION_PATH'] = destination_path


# function to add environment variables to file
def add_env_variables(file, env_dict):
    for key in env_dict:
        file = file.replace(key, env_dict[key])
    return file


# read file for crontabs
with open('/etc/crontabs/root', 'r') as in_file:
    text = in_file.read()

# write file for crontabs
with open('/etc/crontabs/root', 'w') as out_file:
    out_file.write(add_env_variables(text, env_dict))

