# A small docker image running shellinabox

## Base Docker Image
[Ubuntu](https://hub.docker.com/_/ubuntu) 18.04 (x64)

## Software
[shellinabox](https://github.com/shellinabox/shellinabox/) - A web-based terminal server

## Get the image from Docker Hub
```
docker pull fullaxx/shellinabox
```

## Run the image
Run the image on port 4200 (Using an auto-generated self-signed cert)
```
docker run -d \
-e SIABUSER='username' \
-e SIABPASS='putsafepasswordhere' \
-h shellinabox \
-p 4200:4200 \
-v /srv/docker/siab/home:/home \
fullaxx/shellinabox
```

Run the image on port 4200 (Using volume mount to provide your own certificate.pem file)
```
docker run -d \
-e SIABUSER='username' \
-e SIABPASS='putsafepasswordhere' \
-h shellinabox \
-p 4200:4200 \
-v /srv/docker/siab/home:/home \
-v /srv/docker/siab/data:/var/lib/shellinabox \
fullaxx/shellinabox
```

## Build it locally using the github repository
```
docker build -t="fullaxx/shellinabox" github.com/Fullaxx/shellinabox
```
