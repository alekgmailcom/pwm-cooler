ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:latest
FROM $BUILD_FROM

# Устанавливаем необходимые пакеты для GPIO
RUN apk add --no-cache \
    python3 \
    py3-pip \
    libgpiod \
    py3-libgpiod

# Копируем ваш бинарник
COPY main_CM5 /usr/local/bin/main_CM5
RUN chmod +x /usr/local/bin/main_CM5

# Копируем скрипт запуска
COPY run.sh /
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
