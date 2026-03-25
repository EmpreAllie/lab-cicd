#!/bin/bash
chmod +x ./src/app
if [ $? -eq 0 ]; then
    echo "Exited without errors"
    exit 0
else
    echo "Exited with an error"
    exit 1
fi
