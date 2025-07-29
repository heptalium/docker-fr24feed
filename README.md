# docker-fr24feed

Used to build Docker image `ghcr.io/heptalium/fr24feed`

## Prerequisites

- running dump1090 container with enabled raw output mode on port 30002
- `fr24key` is set in `fr24feed.ini`

## Usage

```
docker run -d -p 8754:8754 -v fr24feed.ini:/etc/fr24feed.ini:ro --link dump1090:dump1090 --name fr24feed --restart always ghcr.io/heptalium/fr24feed
```

### Docker Compose

```yaml
services:
  dump1090:
    image: ghcr.io/heptalium/dump1090
    devices:
      - /dev/bus/usb/001/004:/dev/bus/usb/001/004
    restart: always
  fr24feed:
    image: ghcr.io/heptalium/fr24feed
    ports:
      - 8754:8754
    volumes:
      - ./fr24feed.ini:/etc/fr24feed.ini:ro
    restart: always
```
