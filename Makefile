VERSION ?= $(shell cat VERSION)

all: build tag push

buildx:
	docker buildx build --platform linux/amd64,linux/arm64 --push \
	-t jovalle/resume-starter:${VERSION} .

build:
	docker build -t jovalle/resume-starter-dev:${VERSION} .

tag:
	docker tag \
	jovalle/resume-starter-dev:${VERSION} \
	jovalle/resume-starter:${VERSION}

push:
	docker push jovalle/resume-starter:${VERSION}

deploy:
	kubectl apply -f kubernetes/

app:
	kubectl apply -f kubernetes/app/

scale:
	kubectl autoscale deployment resume-starter --cpu-percent=80 --min=1 --max=10

load:
	kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://resume-starter; done"

top:
	kubectl top pods