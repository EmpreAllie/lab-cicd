# ЭТАП 1: Сборка зависимостей и программы
FROM ubuntu:22.04 AS builder
RUN apt-get update && apt-get install -y \
    build-essential cmake git zlib1g-dev libcurl4-openssl-dev

# Клонируем и собираем prometheus-cpp
WORKDIR /libs
RUN git clone https://github.com/jupp0r/prometheus-cpp.git && \
    cd prometheus-cpp && git submodule update --init && \
    mkdir _build && cd _build && \
    cmake .. -DBUILD_SHARED_LIBS=OFF && make -j$(nproc) install

# Собираем твое приложение
WORKDIR /app
COPY src/main.cpp .
RUN g++ main.cpp -o app -lprometheus-cpp-pull -lprometheus-cpp-core -lpthread -lz -lcurl

# ЭТАП 2: Финальный легкий образ
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y libcurl4 && rm -rf /var/lib/apt/lists/*
COPY --from=builder /app/app /usr/local/bin/app
EXPOSE 8080
CMD ["/usr/local/bin/app"]
