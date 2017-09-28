FROM docker:stable

RUN apk update && \
    apk add --no-cache python curl python2-dev libffi-dev alpine-sdk openssl-dev && \
    curl https://bootstrap.pypa.io/get-pip.py | python && \
    pip install certbot &&\
    rm -r  /var/cache/apk/ /root/.cache/pip
#    && apk del python2-dev alpine-sdk

WORKDIR /app
ENV PATH=${PATH}:/app
COPY update-godaddy.sh run.sh ./

ENTRYPOINT []
CMD ./run.sh


