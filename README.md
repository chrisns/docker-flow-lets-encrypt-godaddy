# Docker Flow Let's Encrypt with GoDaddy

![](https://img.shields.io/docker/automated/pinked/docker-flow-lets-encrypt-godaddy.svg)
![](https://img.shields.io/docker/stars/pinked/docker-flow-lets-encrypt-godaddy.svg)
![](https://img.shields.io/docker/pulls/pinked/docker-flow-lets-encrypt-godaddy.svg)
[![license](https://img.shields.io/github/license/pinked/docker-flow-lets-encrypt-godaddy.svg)]()
[![GitHub contributors](https://img.shields.io/github/contributors/pinked/docker-flow-lets-encrypt-godaddy.svg)]()
[![GitHub issues](https://img.shields.io/github/issues/pinked/docker-flow-lets-encrypt-godaddy.svg)]()

## TLDR
 - Docker flow integration withb lets encrypt DNS-01 challenge using Go Daddy
 - Presumes you only have one TLD
 - Reads every domain from docker that has a `servicedomain` and gets a SSL cert for it
 - Handles multiple domains, so long as they live within the TLD
 - Relies on being restarted by the orchestration

## Roadmap
 - [x] environment variables to define how often to renew
 - [x] godaddy key + secret env vars
 - [x] get hostnames requesting ssl by labels
 - [x] start lets encrypt process
 - [x] update godaddy DNS with certificate verification
 - [x] get certificates
 - [x] send certs to docker-flow
 - [x] consider caching above or storing state in a volume so we don't hit rate limits
 
See http://github.com/pinked/infra for an example of this in use