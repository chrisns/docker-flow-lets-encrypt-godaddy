#!/bin/sh

NAME=_acme-challenge.$(echo -n $CERTBOT_DOMAIN | sed -e "s/\.${TLD}//g")

TTL=600

curl -kLsXPUT -H"Authorization: sso-key ${GD_KEY}:${GD_SECRET}" \
  -H"Content-type: application/json" \
  https://api.godaddy.com/v1/domains/${TLD}/records/TXT/${NAME} \
    -d "{\"data\":\"${CERTBOT_VALIDATION}\",\"ttl\":${TTL}}"

sleep 10