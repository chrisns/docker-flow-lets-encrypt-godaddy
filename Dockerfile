FROM docker:17.05.0-ce

RUN apk update && \
    apk add python curl && \
    curl https://bootstrap.pypa.io/get-pip.py | python && \
    pip install certbot cryptography>=1.9 &&\
    rm -r  /var/cache/apk/ /root/.cache/pip

WORKDIR /app
ENV PATH=${PATH}:/app
COPY update-godaddy.sh run.sh ./

ENTRYPOINT []
CMD ./run.sh


