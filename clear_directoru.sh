#!/bin/bash

# Проверка наличия аргумента - пути к директории
if [ "$#" -ne 1 ]; then
    echo "Ошибка! Пожалуйста, укажите путь к директории."
    exit 1
fi

directory="$1"

# Проверка существования директории
if [ ! -d "$directory" ]; then
    echo "Ошибка! Директория '$directory' не существует."
    exit 1
fi

# Очистка директории от файлов с расширениями .bak, .tmp, .backup
find "$directory" -type f \( -name "*.bak" -o -name "*.tmp" -o -name "*.backup" \) -delete

echo "Директория '$directory' очищена от файлов с расширениями .bak, .tmp, .backup."