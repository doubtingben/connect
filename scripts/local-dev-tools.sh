#!/bin/bash

# Check if running on macOS
if [[ "$(uname)" != "Darwin" ]]; then
    echo "Error: This script is only for macOS."
    exit 1
fi

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Error: Homebrew is not installed. Please install Homebrew first."
    echo "Visit https://brew.sh for installation instructions."
    exit 1
fi

# List of binaries to check and install
binaries=(
    "kubectl"
    "helm"
    "yq"
    "kind"
    # Add more binaries as needed
)

# Function to check and install a binary
check_and_install() {
    if ! command -v "$1" &> /dev/null; then
        echo "$1 is not installed. Installing..."
        brew install "$1"
    else
        echo "$1 is already installed."
    fi
}

# Main loop to check and install binaries
for binary in "${binaries[@]}"; do
    check_and_install "$binary"
done

echo "All required binaries are installed."

