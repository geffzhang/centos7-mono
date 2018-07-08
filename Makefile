build:
	docker pull centos:7
	docker build -t centos7-mono:5.12.0.233 -f Dockerfile .
	docker tag centos7-mono:5.12.0.233 docker.io/bryanayers/centos7-mono:latest
	docker tag centos7-mono:5.12.0.233 docker.io/bryanayers/centos7-mono:5.12.0.233
	docker tag centos7-mono:5.12.0.233 docker.io/incendonet/centos7-mono:latest
	docker tag centos7-mono:5.12.0.233 docker.io/incendonet/centos7-mono:5.12.0.233