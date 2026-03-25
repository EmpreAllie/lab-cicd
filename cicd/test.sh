#!/bin/bash
chmod +x ./src/app
<<<<<<< Updated upstream
if [ $? -eq 0 ]; then
    echo "Exited without errors"
=======
./src/app
if [ $? -eq 0 ]; then
    echo "Test passed"
>>>>>>> Stashed changes
    exit 0
else
    echo "Test failed"
    exit 1
fi
