#!/usr/bin/env bashio

set -e

echo "=== PWM cooling Control add-on starting ==="

# Ждём, пока система полностью загрузится
sleep 5

# Проверяем доступ к GPIO
echo "=== Checking GPIO access ==="
if [ -e /dev/gpiochip0 ]; then
    echo "✅ /dev/gpiochip0 found"
else
    echo "⚠️  /dev/gpiochip0 not found"
fi

if [ -e /dev/gpiomem ]; then
    echo "✅ /dev/gpiomem found"
fi

# Запускаем вашу программу
echo "=== Starting main_CM5 ==="
cd /config

exec /usr/local/bin/main_CM5
