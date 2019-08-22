SHELL := /bin/bash
UVERSION := 18.04
DOCKERTAG := choppsv1/nginx

all: build

build:
	docker build --build-arg=UVERSION=$(UVERSION) -t $(DOCKERTAG):$(UVERSION) .
