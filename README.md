# What?

This is a docker environment that you can build locally and be sure that all
traffic from the browser goes through Tor.

I build it mostly for fun, to learn more about docker and iptables, inspired by
[this wish on reddit](https://www.reddit.com/r/programming/comments/3ncftj/docker_image_with_tor_privoxy_and_a_process/cvmxw4d).

# Why?

Presumably because you're paranoid.

# How?

1. Install [Docker](https://docs.docker.com/installation/) and [Docker Compose](https://docs.docker.com/compose/install/)
2. `git clone https://github.com/ahri/docker-private-browsing.git && cd docker-private-browsing`
3. `docker-compose build && docker-compose run browser`

If your (host) uid/gid don't match 1000/1000 then you'll need to run with: ```docker-compose run browser `id -u` `id -g` ```

## Notes

Firefox, Tor, IPTables and the Firefox extensions uBlock Origin and HTTPS
Everywhere were used to build these containers on top of Alpine Linux.

I'm redistributing the above mentioned extensions but of course the copyright is
entirely owned by the original authors.
