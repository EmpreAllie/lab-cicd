#!/bin/bash
chmod +x ./src/app
if ./src/app; then
    echo "Exited without errors"
    exit 0
else
    echo "Exited with an error"
    exit 1
fi
