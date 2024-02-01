#!/bin/bash

# Bash script for downloading videos from popular websites

# Check if youtube-dl is installed
if ! command -v youtube-dl &> /dev/null; then
    echo "Error: youtube-dl is not installed. Please install it first."
    exit 1
fi

# Function to display usage
usage() {
    echo "Usage: $0 <URL> [OPTIONS]"
    echo "OPTIONS:"
    echo "  -a, --audio       Download only audio"
    echo "  -h, --help        Display this help message"
    exit 1
}

# Check if URL is provided
if [ -z "$1" ]; then
    usage
fi

# Parse command line options
while [ "$#" -gt 0 ]; do
    case "$1" in
        -a|--audio)
            audio_only=true
            shift
            ;;
        -h|--help)
            usage
            ;;
        *)
            url="$1"
            shift
            ;;
    esac
done

# Download video or audio based on the configuration
if [ "$audio_only" = true ]; then
    echo "Downloading audio only from: $url"
    youtube-dl -x --audio-format mp3 "$url"
else
    echo "Downloading video from: $url"
    youtube-dl "$url"
fi

echo "Download complete!"
