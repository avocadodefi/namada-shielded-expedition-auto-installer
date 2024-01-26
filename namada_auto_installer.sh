#!/bin/bash

# Function to check if Docker is installed
check_docker_installed() {
    if ! command -v docker &> /dev/null
    then
        echo "Docker could not be found, installing..."
        install_docker
    else
        echo "Docker is already installed."
    fi
}

# Function to install Docker
install_docker() {
    sudo apt-get update
    if [ $? -ne 0 ]; then echo "Failed to update package list, exiting"; exit 1; fi

    sudo apt-get install -y docker.io
    if [ $? -ne 0 ]; then echo "Failed to install Docker, exiting"; exit 1; fi

    sudo systemctl start docker
    if [ $? -ne 0 ]; then echo "Failed to start Docker service, exiting"; exit 1; fi

    sudo systemctl enable docker
    if [ $? -ne 0 ]; then echo "Failed to enable Docker service, exiting"; exit 1; fi
}

# Function to pull the Namada docker image
pull_namada_image() {
    local namada_version="v0.16.0" # Use the desired version number
    docker pull namada_image:$namada_version
    if [ $? -ne 0 ]; then echo "Failed to pull Namada image, exiting"; exit 1; fi
}

# Function to run the Namada docker image
run_namada_image() {
    export CHAIN_ID="your_chain_id" # Set your chain ID
    local docker_image=$(docker images | grep "namada_image" | awk '{print $1":"$2}' | head -n 1)

    # Run your Namada command
    docker run -P -i -t "$docker_image" your_namada_command
    if [ $? -ne 0 ]; then echo "Failed to run Namada image, exiting"; exit 1; fi
}

# Main script execution
check_docker_installed
pull_namada_image
run_namada_image
