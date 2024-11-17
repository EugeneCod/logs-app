# Запуск с помощью команды make run
# Утилита make должна быть установлена в системе
run:
	docker run -d -p 80:4200 --env-file ./config/.env --rm --name logsapp logsapp:volumes
# Запуск с volumes
run-volumes:
	docker run -d -p 80:4200 --env-file ./config/.env -v logs:/app/data --rm --name logsapp logsapp:volumes
# Запуск в режиме разработки (hot-reload)
run-dev:
	docker run -d -p 80:4200 --env-file ./config/.env -v "D:\IT\Docker\docker-practice\logs-app:/app" -v /app/node_modules:/app -v logs:/app/data --rm --name logsapp logsapp:volumes
stop:
	docker stop logsapp