#!/bin/bash

echo "=== Cyber-Rage Tunnel Panel ==="
echo "Starting Xray-core..."

xray run -config /app/xray_config.json &
XRAY_PID=$!

sleep 2

echo "Starting Python server..."
python main.py &
PYTHON_PID=$!

echo "=== All services started ==="
echo "Xray-core PID: $XRAY_PID"
echo "Python PID: $PYTHON_PID"

wait $XRAY_PID $PYTHON_PID
