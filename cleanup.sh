#!/bin/bash

_dir="$(dirname "$0")"

source "$_dir/config.sh"

# Strip only the top domain to get the zone id
DOMAIN=$(expr match "$CERTBOT_DOMAIN" '.*\.\(.*\..*\)')
API="https://www.webnames.ru/scripts/json_domain_zone_manager.pl"
CREATE_DOMAIN="_acme-challenge.$CERTBOT_DOMAIN"
PARAMS="apikey=$API_KEY&domain=$CERTBOT_DOMAIN&type=TXT&record=$CREATE_DOMAIN:$CERTBOT_VALIDATION"

# Create TXT record
RESULT=$(curl -s -X POST $API -d "$PARAMS&action=delete")

echo "cleanup: $RESULT"