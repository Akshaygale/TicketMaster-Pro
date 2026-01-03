#!/bin/bash

FRONTEND_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost)
BACKEND_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/health)

if [ "$FRONTEND_STATUS" -eq 200 ] && [ "$BACKEND_STATUS" -eq 200 ]; then
    echo "All services running ✅"
    exit 0
else
    echo "Something is wrong ❌"
    exit 1
fi
