up:
	docker-compose -f "docker/docker-compose.yml" --env-file .env up -d

stop:
	docker-compose -f "docker/docker-compose.yml" stop