docker run \
    -e UPDATES=enabled \
    -e ALLOW_CORS=enabled \
    -e THREADS=16 \
    -e "OSM2PGSQL_EXTRA_ARGS=-C 8000" \
    -e TERM=xterm-256color \
    -v openstreetmap-data:/var/lib/postgresql/12/main \
    -v openstreetmap-rendered-tiles:/var/lib/mod_tile \
    mshakurov/openstreetmap-tile-server \
    test
