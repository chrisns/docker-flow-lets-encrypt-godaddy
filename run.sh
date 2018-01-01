#!/bin/sh
for i in $(docker service ls -q); do
  DOMAINS="${DOMAINS} $(docker service inspect $i --format='-d {{index .Spec.Labels "com.df.serviceDomain"}}' | grep $TLD | uniq)"
done

echo ${DOMAINS}

certbot --hsts --redirect --manual-public-ip-logging-ok --expand --agree-tos -m ${CERTBOT_EMAIL} -a manual ${DOMAINS} --preferred-challenges dns-01 -n --manual-auth-hook update-godaddy.sh ${EXTRA_CERTBOT_ARGS} certonly

CERT_PATH=$(find /etc/letsencrypt -name fullchain.pem)
PRIV_KEY=$(find /etc/letsencrypt -name privkey.pem)

docker service update proxy_proxy --secret-rm=cert-combined.pem --detach=false
docker secret rm cert-combined.pem
cat ${CERT_PATH} ${PRIV_KEY} | docker secret create cert-combined.pem -
docker service update proxy_proxy --secret-add=cert-combined.pem --detach=false