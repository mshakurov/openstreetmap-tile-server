docker volume create openstreetmap-data
docker volume create openstreetmap-rendered-tiles

docker run \
    -shm-size=1g \
    -e UPDATES=enabled \
    -e ALLOW_CORS=enabled \
    -e THREADS=16 \
    -e "OSM2PGSQL_EXTRA_ARGS=-C 8000" \
    -e OVERWRITEOSMDATA=1 \
    -v /home/user/downloads/russia-latest.osm.pbf:/data.osm.pbf \
    -v /home/user/downloads/russia.poly:/data.poly \
    -v openstreetmap-data:/var/lib/postgresql/12/main \
    -v openstreetmap-rendered-tiles:/var/lib/mod_tile \
    mshakurov/openstreetmap-tile-server \
    import
