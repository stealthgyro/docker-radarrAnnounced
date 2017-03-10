The way somethings are hardcoded you will want to make sure to have a settings.cfg in your /config volume, which will also include the python scripts for the trackers.

This is still very much in development and still in active testing.

1. After the initial run, the whole app will be in your /config directory.
2. you will need to have at least on tracker configured in the settings.cfg before it will work
3. after the edit you might need to do a docker restart.
4. important files to keep

+ **settings.cfg**
+ **brain.db**
+ **status.log**

if there are issues with updating, just delete all files except those.



[radarrAnnounced](https://github.com/stealthgyro/radarrAnnounced) Python script to notify radarr of tracker announcements from IRC announce channels.


## Usage

```
docker create \
	--name=radarrannounced \
	-v <path to data>:/config \
	-e PGID=<gid> -e PUID=<uid>  \
	-e TZ=<timezone> \
	-p 3468:3468 \
	stealthgyro/docker-radarrAnnounced
```

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. 
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`


* `-p 3467` - the port(s)
* `-v /config` - radarrannounced Application Data
* `-e PGID` for for GroupID - see below for explanation
* `-e PUID` for for UserID - see below for explanation
* `-e TZ` for timezone information, eg Europe/London

It is based on alpine-linux with S6 overlay, for shell access whilst the container is running do `docker exec -it radarrannounced /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application
Access the webui at `<your-ip>:3467`, for more information check out [radarrannounced](https://github.com/stealthgyro/radarrAnnounced).

## Info

* To monitor the logs of the container in realtime `docker logs -f radarrannounced`.

## Version Log

+ **2017-02-28:** initial 
