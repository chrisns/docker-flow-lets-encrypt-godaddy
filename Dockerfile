FROM docker:stable

WORKDIR /app

RUN set -ex \
  && apk add --no-cache --virtual .run-deps \
    python curl bash \
  && apk --no-cache add --virtual .build-deps \
    python2-dev \
    libffi-dev \
    alpine-sdk \
    openssl-dev \
  && curl https://bootstrap.pypa.io/get-pip.py | python \
  && curl https://gist.githubusercontent.com/MLescaudron/e8248d32d3a5b8caaf622c1a829cf067/raw/03fbd7f2a54ed5483b077f9f2fee419679c43533/updateSecret.sh > ./updateSecret.sh \
  && chmod +x ./updateSecret.sh \
  && pip install certbot \
  && apk --purge del .build-deps \
  && rm -rf  /var/cache/apk/ /root/.cache/pip

ENV PATH=${PATH}:/app
COPY update-godaddy.sh run.sh ./

ENTRYPOINT []
CMD ./run.sh


