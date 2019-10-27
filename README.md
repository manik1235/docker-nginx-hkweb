Install nginx
Install rails
Install git
Pull repo
Show on localhost:80

Should I put the rails app and nginx app in separate services?
Yes. I think so.

# Instructions

## Prerequisites
* Docker version 19.03.3, build a872fc2f86
* docker-compose version 1.24.1, build 4667896b

## Setup

1. Clone the repo locally:
`git clone git@github.com:manik1235/docker-nginx-hkweb.git

2. Build the Dockerfiles using docker compose
```cd docker-nginx-hkweb
docker-compose build```

3. Bring the container up (Running in the background/detacted state)
`docker-compose up -d`
