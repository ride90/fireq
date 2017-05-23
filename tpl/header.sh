#!/bin/bash
{{{header_doc}}}
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -exuo pipefail

export DEBIAN_FRONTEND=noninteractive
export DBUS_SESSION_BUS_ADDRESS=/dev/null

_activate() {
    set +ux -a
    . {{repo}}/activate
    set -ux +a
}

_missing_db() {
    curl -sI http://$DB_HOST:9200/$DB_NAME | grep -q 404
}

_missing_db() {
    curl -sI $ELASTICSEARCH_URL/$ELASTICSEARCH_INDEX | grep -q 404
}

_skip_install() {
    dpkg -l | grep '^ii.*'$1 && [ -z ${pkg_upgrade:-'{{pkg_upgrade}}'} ]
}
