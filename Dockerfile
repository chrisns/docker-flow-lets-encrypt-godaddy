FROM docker:1.13-dind

RUN apk update && \
    apk add curl certbot && \
    curl https://bootstrap.pypa.io/get-pip.py | python && \
    pip uninstall -y certbot && \
    pip install certbot

#RUN chmod +x /usr/local/bin/external-handler.sh

#COPY heart-internet.php /usr/local/bin
#RUN chmod +x /usr/local/bin/heart-internet.php


#CMD certbot --manual-public-ip-logging-ok --staging --agree-tos -m chris@cns.me.uk -a manual -d p.cns.me --preferred-challenges dns-01 -n --manual-auth-hook heart-internet.php certonly

WORKDIR /app
ENV PATH=${PATH}:/app
COPY update-godaddy.sh run.sh ./

ENTRYPOINT /bin/sh
CMD sleep 92312312