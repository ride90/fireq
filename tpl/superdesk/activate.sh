# use virtualenv
. {{repo_env}}/bin/activate

set -a
PATH=./node_modules/.bin/:$PATH
LANG=en_US.UTF-8
LANGUAGE=en_US:en
LC_ALL=en_US.UTF-8
PYTHONIOENCODING="utf-8"
PYTHONUNBUFFERED=1
C_FORCE_ROOT=1

[ -f {{config}} ] && . {{config}}

cd {{repo_server}}
# load settings and export into environment variables
cat <<EOF0 | python > /tmp/settings.sh
try:
    from settings import *
except ImportError:
    SUPERDESK_URL='http://localhost/api'
    SUPERDESK_WS_URL='ws://localhost/ws'

print('\n'.join(('%s=%r' % (k, v)) for k, v in locals().items() if k.isupper()))
EOF0
. /tmp/settings.sh
set +a
