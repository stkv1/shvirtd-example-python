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
Имя скрипта - git-copy.sh

Результат проверки https://check-host.net/check-http:

![check](https://github.com/stkv1/shvirtd-example-python/blob/main/images/104.PNG)

SQL-запрос

![check](https://github.com/stkv1/shvirtd-example-python/blob/main/images/79.PNG)

### Задача 6
Скриншот выполнения dive:

![dive](https://github.com/stkv1/shvirtd-example-python/blob/main/images/110.PNG)

`docker save hashicorp/terraform:latest -o hashicorp-terraform.tar`

`tar -xvf архив.tar`

Слои после распаковки архива

![layers](https://github.com/stkv1/shvirtd-example-python/blob/main/images/112.PNG)

Манифест

![manifest](https://github.com/stkv1/shvirtd-example-python/blob/main/images/114.PNG)

Искомый файл может быть в любом из слоев поэтому распаковываем все слои в папку:

`tar xzf extracted/blobs/sha256/<хэш_слоя> -C output_dir`

Папка с файлами после распаковки, файл terraform присутствует:

![bin](https://github.com/stkv1/shvirtd-example-python/blob/main/images/116.PNG)




