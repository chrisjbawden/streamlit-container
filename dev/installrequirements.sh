#!/bin/bash

# Find all requirements.txt files in the /app directory and its subdirectories
for req_file in $(find /app -type f -name "requirements.txt"); do
    # Install requirements if the file exists
    if [ -f "$req_file" ]; then
        echo "Installing requirements from $req_file"
        pip install --upgrade pip
        pip install -r "$req_file"
    fi
done

# Execute the CMD from the Dockerfile
exec "$@"
