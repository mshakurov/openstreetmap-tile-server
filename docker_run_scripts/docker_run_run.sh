#docker volume create openstreetmap-data
#docker volume create openstreetmap-rendered-tiles

docker run \
    --shm-size=1g \
    -p 8080:80 \
    -p 5432:5432 \
    -e UPDATES=enabled \
    -e ALLOW_CORS=enabled \
    -e THREADS=24 \
    -e "OSM2PGSQL_EXTRA_ARGS=-C 6000" \
    -v openstreetmap-data:/var/lib/postgresql/12/main \
    -v openstreetmap-rendered-tiles:/var/lib/mod_tile \
    -v openstreetmap-rendered-tiles-logs:/var/log/tiles \
    -d \
	--restart unless-stopped \
	mshakurov/openstreetmap-tile-server \
    run
