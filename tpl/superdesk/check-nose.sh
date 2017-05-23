{{>dev.sh}}

{{>add-dbs.sh}}
{{>testing.sh}}

time nosetests -v --with-id
