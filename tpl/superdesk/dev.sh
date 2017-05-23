_activate
cd {{repo_server}}
[ ! -f dev-requirements.txt ] || time pip install -r dev-requirements.txt

cat <<EOF > /etc/profile.d/env.sh
. {{repo}}/activate
EOF
