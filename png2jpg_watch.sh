#!/bin/bash

# Exit if run as root
if [ "$EUID" -eq 0 ]; then
    echo "This script must be run as a normal user, not as root."
    exit 1
fi

# Default values
QUALITY=90
WATCHDIR="$HOME/Bilder/Bildschirmfotos"
KEEPPNG=0

# Function for Help
usage() {
    cat << EOF
Usage: $0 [OPTIONS]

Options:
  -q 1-100        Set JPEG quality (default: 90)
  -p /path/folder Set watch directory (default: $HOME/Pictures/unsorted_photos)
  -k              Keep PNG files (default: delete)
  -h              Show this help message

Example:
  $0 -q 80 -p /home/user/Pictures/screenshots -k
EOF
    exit 0
}

# Parse options
while getopts "q:p:kh" opt; do
    case $opt in
        q) QUALITY="$OPTARG";;
        p) WATCHDIR="$OPTARG";;
        k) KEEPPNG=1;;
        h) usage;;
        *) usage;;
    esac
done

# Check if watch directory exists
if [ ! -d "$WATCHDIR" ]; then
    echo "Directory $WATCHDIR does not exist. Please create it."
    exit 1
fi

echo "Watching directory: $WATCHDIR"
echo "JPEG quality: $QUALITY"
if [ $KEEPPNG -eq 1 ]; then
    echo "PNG files will be kept."
else
    echo "PNG files will be deleted."
fi

# Start recursive inotifywait
inotifywait -m -r -e moved_to -e create --format '%w%f' "$WATCHDIR" | while read FILE; do
    if [[ "$FILE" == *.png ]]; then
        # Target JPG filename
        JPGFILE="${FILE%.png}.jpg"
        # small pause in case the file is still being written
        sleep 0.5
        convert "$FILE" -quality "$QUALITY" "$JPGFILE"
        # delete PNG if not keeping
        if [ $KEEPPNG -eq 0 ]; then
            rm "$FILE"
        fi
        echo "Converted: $(basename "$FILE") → $(basename "$JPGFILE")"
    fi
done
