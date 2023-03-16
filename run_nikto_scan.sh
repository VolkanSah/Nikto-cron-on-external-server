#!/bin/bash

TARGET_URL="http://yourserver.com"
LOG_DIR="/path/to/scan/logs"
LOG_FILE="nikto_$(date +%Y%m%d_%H%M%S).log"

mkdir -p "$LOG_DIR"
nikto -h "$TARGET_URL" -o "$LOG_DIR/$LOG_FILE"
