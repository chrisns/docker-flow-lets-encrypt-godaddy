Docker Flow Let's Encrypt with GoDaddy
==================

## Roadmap
 - [ ] environment variables to define how often to renew
 - [ ] godaddy key + secret env vars
 - [ ] get hostnames requesting ssl by labels
 - [ ] start lets encrypt process
 - [ ] update godaddy DNS with certificate verification
 - [ ] get certificates
 - [ ] send certs to docker-flow
 - [ ] consider caching above or storing state in a volume so we don't hit rate limits