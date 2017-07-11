FROM docker:17.05.0-ce

RUN apk update && \
    apk add python py-cryptography curl && \
    curl https://bootstrap.pypa.io/get-pip.py | python && \
    pip install certbot &&\
    rm -r  /var/cache/apk/ /root/.cache/pip

WORKDIR /app
ENV PATH=${PATH}:/app
COPY update-godaddy.sh run.sh ./

ENTRYPOINT []
CMD ./run.sh


