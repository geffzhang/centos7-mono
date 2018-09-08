build:
	docker pull centos:7
	docker build -t centos7-mono:5.14.0.177 -f Dockerfile .
	docker tag centos7-mono:5.14.0.177 docker.io/bryanayers/centos7-mono:latest
	docker tag centos7-mono:5.14.0.177 docker.io/bryanayers/centos7-mono:14.0.177
	docker tag centos7-mono:5.14.0.177 docker.io/incendonet/centos7-mono:latest
	docker tag centos7-mono:5.14.0.177 docker.io/incendonet/centos7-mono:5.14.0.177
