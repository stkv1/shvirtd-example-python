#!/usr/bin/env bash
set -euo pipefail

# --- НАСТРОЙКИ ---
# Замените на URL вашего форка репозитория
REPO_URL="https://github.com/stkv1/shvirtd-example-python.git"

# Имя директории внутри /opt (можно изменить)
TARGET_DIR="/opt/project/"
LOCAL_DIR=="/opt/project/shvirtd-example-python/"

# Проверка наличия git и docker
if ! command -v git &> /dev/null; then
  echo "Ошибка: git не установлен. Установите его перед запуском скрипта." >&2
  exit 1
fi

if ! docker info &> /dev/null; then
  echo "Ошибка: Docker не запущен или не установлен." >&2
  exit 1
fi

# Проверка прав на запись в /opt
if [[ ! -w /opt ]]; then
  echo "Ошибка: нет прав на запись в /opt. Запустите скрипт от root или через sudo." >&2
  exit 1
fi

echo "Клонирование репозитория: $REPO_URL"

cd "$TARGET_DIR"
# Делаем git init, если не сделано
if [[ ! -f .git ]]; then
  echo "Делаем git init"
  git init
fi

# Если папка уже существует, можно либо обновить её, либо выдать ошибку.
if [[ -d "$TARGET_DIR" ]]; then
  echo "Директория $TARGET_DIR уже существует. Выполняем git clone..."
  (cd "$TARGET_DIR" && git pull "$REPO_URL")
fi

#echo "Переход в директорию: $LOCAL_DIR"
#cd "$LOCAL_DIR"

#Так как папка из репозитория копируется целиком, переносим ее содержимое в каталог project
#echo "Папка $LOCAL_DIR не пустая, копируем в $TARGET_DIR"
#mv "$LOCAL_DIR". "$TARGET_DIR"

# Проверка наличия docker-compose.yml или compose.yaml
if [[ ! -f docker-compose.yml && ! -f compose.yaml ]]; then
  echo "Ошибка: файл docker-compose.yml или compose.yaml не найден в $TARGET_DIR" >&2
  exit 1
fi

echo "Запуск docker compose up..."
# Используем 'docker compose' (V2 плагин). Если у вас старый docker-compose, замените на 'doc>
  cd "$TARGET_DIR"
  sudo docker compose up
