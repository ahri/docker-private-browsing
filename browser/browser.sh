#!/bin/sh

set -ue

err()
{
    format="$1"
    shift
    printf "$format\n" "$@" 1>&2
    exit 1
}

if [ $# -lt 2 ]; then
	err "ERROR: provide uid and gid to execute as"
fi

uid=$1
gid=$2

shift 2

if ! echo "$uid" | grep -Eq '^[0-9]+$'; then
	err "ERROR: uid must be one or more digits"
fi

if ! echo "$gid" | grep -Eq '^[0-9]+$'; then
	err "ERROR: gid must be one or more digits"
fi

echo "docker:*:$uid:$gid:Docker:/home/docker:/bin/sh" >> /etc/passwd
echo "docker:*:$gid:" >> /etc/group
mkdir -p /home/docker
chown docker:docker /home/docker

chown docker:docker /downloads
chown -R docker:docker /profile

iptables -F
iptables --policy OUTPUT DROP
iptables -A OUTPUT -p tcp --dport 9100 -d tor -j ACCEPT

su -c "cd && firefox --profile /profile" docker
