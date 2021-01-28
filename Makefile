build:
	docker build -t covid19cuba-apijssync:latest .

deploy:
	docker run -d -p 4000:4000  --name covid19cuba-apijssync-container --env-file .env covid19cuba-apijssync:latest

rmcontainer:
	docker container rm covid19cuba-apijssync-container --force

rmimage:
	docker image rm covid19cuba-apijssync:latest

build_deploy: build deploy

rmall: rmcontainer rmimage

redeploy: rmall build_deploy

logs:
	docker logs covid19cuba-apijssync-container

view:
	docker ps --all

stats:
	docker stats

view_images:
	docker images
