#!/bin/bash

## Set some Twilio globals
account_sid="" # Your live account sid from Account -> Account Settings
auth_token="" # Your live auth token from Account -> Account Settings
from="" # Twilio phone number

## Values received by this script:
# To = $1 (Phone number to text, specified in the Zabbix web interface; "+12345678")
# Subject = $2 (usually either PROBLEM or RECOVERY)
# Message = $3 (whatever message the Zabbix action sends, preferably something like "Zabbix server is unreachable for 5 minutes - Zabbix server (127.0.0.1)")

# Get the Phone number and subject ($2 - hopefully either PROBLEM or RECOVERY)
to="$1"
subject="$2"

# The message that we want to send is the "subject" value ($2 / $subject - that we got earlier)
#  followed by the message that Zabbix actually sent us ($3)
message="${subject}: $3"

# Make a POST request to the twilio messaging service
curl -X POST -F "Body=${message}" \
    -F "From=${from}" -F "To={$to}" \
    "https://api.twilio.com/2010-04-01/Accounts/${account_sid}/Messages" \
    -u "${account_sid}:${auth_token}"
