### Задача 1
Dockerfile.python
```#Этап 1 - Копирование файлов
FROM python:3.12-slim AS builder
WORKDIR /app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5000
#Этап 2 - Запускаем приложение с помощью uvicorn, делая его доступным по сети
FROM builder
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"]
```

### Задача 3
Использовано два файла .env - env-web и env-db для передачи соответственно в web и db-контейнеры из-за разных именований переменных в контейнерах. Значения переменных передаются одни и те же.
Контейнеры запущены:
![контейнеры](https://github.com/stkv1/shvirtd-example-python/blob/main/images/22.PNG)

`curl -L http://127.0.0.1:8090`

![curl](https://github.com/stkv1/shvirtd-example-python/blob/main/images/50.PNG)

В браузере

![web](https://github.com/stkv1/shvirtd-example-python/blob/main/images/47.PNG)

`show databases;`

![db](https://github.com/stkv1/shvirtd-example-python/blob/main/images/60.PNG)

`show tables;`

![tables](https://github.com/stkv1/shvirtd-example-python/blob/main/images/62.PNG)

Запросы

![requests](https://github.com/stkv1/shvirtd-example-python/blob/main/images/63.PNG)

`docker compose down`

![down](https://github.com/stkv1/shvirtd-example-python/blob/main/images/64.PNG)


### Задача 4

### Задача 6
Не получилось выполнить. Образ скачан, но команда
`dive hashicorp/terraform:latest` выводит
```Image Source: docker://hashicorp/terraform:latest
Fetching image... (this can take a while for large images)
Handler not available locally. Trying to pull 'hashicorp/terraform:latest'...
cannot fetch image
cannot find docker client executable
