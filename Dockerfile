FROM ubuntu:latest

# Устанавливаем зависимости
RUN apt-get update && apt-get install -y dpkg

# Создаем папку для временного хранения пакета внутри контейнера
WORKDIR /app

# Копируем пакет
COPY pogorelov-lab-v1.deb /app/

# Устанавливаем пакет
RUN dpkg -i /app/pogorelov-lab-v1.deb || apt-get -f install -y

# Команда для запуска
CMD ["/usr/local/bin/app"]
