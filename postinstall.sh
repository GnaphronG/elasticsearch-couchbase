#! /bin/sh
spin='-\|/'
i=0

gosu elasticsearch elasticsearch -d

while ! curl -s http://localhost:9200 2>&1 1>/dev/null
do
    i=$(( (i+1) %4 ))
    printf "\r${spin:$i:1}"
    sleep .1
done
printf "\r\r"
curl -s -XGET 'http://localhost:9200/_cluster/health?wait_for_status=green&timeout=50s' | grep -q '"timed_out":false'
curl -s -XPUT http://localhost:9200/_template/couchbase -d @plugins/transport-couchbase/couchbase_template.json -o /dev/null 

rm -- "$0"
