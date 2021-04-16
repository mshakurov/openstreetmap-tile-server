#!/bin/bash

set -x

let OSMTABCOUNT=0+$(sudo -u postgres psql -d gis -X -A -c "select count(*) from information_schema.tables where table_schema = 'public' and table_catalog = 'gis'" -q -t)
echo $OSMTABCOUNT

if ((OSMTABCOUNT==0)); then echo No OSM tables; else echo OSM tables count: $OSMTABCOUNT; fi

if ((OSMTABCOUNT>0)); then
    set +x >null
    echo "@@@ OSM tables already exists!"
    echo "@@@ To create new OSM data use environment variable \$OVERWRITEOSMDATA"
    set -x
    exit 5
fi

echo Begin import process
exit 0

