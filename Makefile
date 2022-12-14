CURRENT_TIME = $(shell date +'%y.%m.%d %H:%M:%S')
CURRENT_TAG = "v0.2`"

build:
	docker build --no-cache -t emhavis/pkc_keycloak:${CURRENT_TAG} .

buildAndPush:
	docker build --no-cache -t emhavis/pkc_keycloak:${CURRENT_TAG} .
	docker push emhavis/pkc_keycloak:${CURRENT_TAG}

push:
	docker push emhavis/pkc_keycloak:${CURRENT_TAG}

build_no_cache:
	docker build --no-cache -t emhavis/pkc_keycloak:${CURRENT_TAG} .
	
push_no_cache:
	docker push emhavis/pkc_keycloak:v0.6

commitToGitHub:
	git add .
	git commit -m 'Created Makefile for the first time, and committed at ${CURRENT_TIME}'
	git push

buildMulti:
	docker buildx build --platform linux/amd64,linux/arm64 -t emhavis/pkc_keycloak:${CURRENT_TAG} --push .

buildMultiLocal:
	docker buildx build --platform linux/amd64,linux/arm64 -t localhost:5000/pkc_keycloak:${CURRENT_TAG} --push .