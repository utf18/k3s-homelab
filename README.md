# k3s-homelab

part of my homelab on an intel nuc running debian

this will install k3s with ansible on debian.
I am using a public domain for the traefik lb and i am getting
letsencrypt wildcard certificates with dns-01 challenge.
Domain is hosted on ovh.

this is tied to my setup, but should be generic enough to use it right away. some changes in the helm values files may be required for the traefik config if you want to use self signed certs, though.

## requirements:

- ansible
- rsync (i am using the synchronize module for faster copy speed n ansible)
- ssh-key auth, this will not work with password auth


## getting started

clone or edit the inventory and run it on a debian server.
may run without problems on ubuntu, but haven't tested.

after that run

`ansible-playbook -i inventories/example-inventory install.yml`


### grafana login is: *grafana.your-domain*

user: admin

password: from your inventory

### kibana login is: *kibana.your-domain*

user: elastic

password: `kubectl -n logging get secret elasticsearch-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode`


### traefik login is: *traefik.your-domain*

basic auth is from your inventory

## contributions

issues or pull requests are very welcome