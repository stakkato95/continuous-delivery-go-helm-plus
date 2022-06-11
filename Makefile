ifeq ($(OS),Windows_NT)
SHELL := powershell.exe
.SHELLFLAGS := -NoProfile -Command
endif

.DEFAULT_GOAL := docker-push-image

# local dev
test:
	go test ./...
.PHONY:test

build: test
	go build main.go
.PHONY:build

run-with-env: build
	docker run --rm -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -e POSTGRES_DB=test -p 5432:5432 -d postgres:latest
	$$env:APP_DB_USERNAME='postgres'; $$env:APP_DB_PASSWORD='postgres'; $$env:APP_DB_NAME='test'; $$env:APP_DB_HOST='localhost'; ./main
.PHONY:run-with-env

# clear local dev
clear:
	rm main.exe
.PHONY:clear

# docker
docker-build-image:
	docker build -t stakkato95/continuous-delivery-go:0.1.3 . -f Dockerfile
.PHONY:docker-build-image

docker-push-image: docker-build-image
	docker push stakkato95/continuous-delivery-go:0.1.3
.PHONY:docker-push-image

# docker-run-tmp-container:
# 	docker run --rm -p 8080:8080 -d stakkato95/continuous-delivery-go
# .PHONY:docker-local-container
