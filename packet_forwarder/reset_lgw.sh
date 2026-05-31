#!/bin/bash

python3 - <<'EOF'
import RPi.GPIO as GPIO
import time

RESET_PIN    = 17
POWER_EN_PIN = 18
SX1261_PIN   = 22
ADC_PIN      = 13

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
for pin in [RESET_PIN, POWER_EN_PIN, SX1261_PIN, ADC_PIN]:
    GPIO.setup(pin, GPIO.OUT, initial=GPIO.LOW)

print("CoreCell power enable through GPIO18...")
GPIO.output(POWER_EN_PIN, GPIO.HIGH)
time.sleep(0.1)

print("CoreCell reset through GPIO17...")
GPIO.output(RESET_PIN, GPIO.HIGH)
time.sleep(0.1)
GPIO.output(RESET_PIN, GPIO.LOW)
time.sleep(0.1)

print("SX1261 reset through GPIO22...")
GPIO.output(SX1261_PIN, GPIO.HIGH)
time.sleep(0.1)
GPIO.output(SX1261_PIN, GPIO.LOW)
time.sleep(0.1)

print("ADC reset through GPIO13...")
GPIO.output(ADC_PIN, GPIO.HIGH)
time.sleep(0.1)
GPIO.output(ADC_PIN, GPIO.LOW)
time.sleep(0.1)

GPIO.cleanup()
EOF
