#!/bin/sh

for i in $(docker service ls -q); do
  DOMAINS=${DOMAINS}$(docker service inspect $i | grep com.df.serviceDomain | grep -i $TLD | awk '{print $2}' | sed 's/[",]//g' | tr '\n' ',' )
done

DOMAINS="-d "$(echo -n ${DOMAINS%?} | sed 's/,/ -d /g')

certbot --manual-public-ip-logging-ok --expand --agree-tos -m ${CERTBOT_EMAIL} -a manual ${DOMAINS} --preferred-challenges dns-01 -n --manual-auth-hook update-godaddy.sh ${EXTRA_CERTBOT_ARGS} certonly

CERT_PATH=$(find /etc/letsencrypt -name fullchain.pem)
PRIV_KEY=$(find /etc/letsencrypt -name privkey.pem)

cat ${CERT_PATH} > /tmp/combined.pem

cat ${PRIV_KEY} >> /tmp/combined.pem

curl -i -XPUT \
    --data-binary @/tmp/combined.pem \
    "${DF_NOTIF_CERT_SERVICE_URL}?certName=fullchain.pem&distribute=true&redirectWhenHttpProto=true"

sleep ${REFRESH}