#!/bin/bash

# Проверяем, что передан аргумент
if [ $# -ne 1 ]; then
  echo "Usage: $0 <path>"
  exit 1
fi

# Проверяем, что путь существует
if [ ! -d $1 ]; then
  echo "Error: $1 is not a valid directory"
  exit 1
fi

# Переходим в папку
cd $1

# Получаем список всех файлов
files=$(ls)

# Цикл по всем файлам
for file in $files; do
  # Получаем владельца файла
  owner=$(stat -c "%U" $file)
  
  # Создаем директорию с именем владельца, если ее еще нет
  if [ ! -d $owner ]; then
    mkdir $owner
  fi

  # Копируем файл в соответствующую директорию
  cp $file $owner
done