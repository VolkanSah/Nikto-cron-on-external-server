# Nikto Security Scanner Setup
### Description
This repository contains instructions for setting up and running Nikto Security Scanner on an external server.

To set up Nikto Security Scanner on an external server, follow these steps:

- Set up an external server where you want to run the security scans. You can rent a VPS (Virtual Private Server) from providers like DigitalOcean, AWS, Google Cloud, or any other cloud platform.
- Install the required tools on the external server. To install Nikto, run the following command (assuming you are using an Ubuntu-based system):
```bash
sudo apt update
sudo apt install nikto -y
```
- Create a shell script that executes the Nikto scan. For example, create a file named run_nikto_scan.sh:

```bash
#!/bin/bash

TARGET_URL="http://yourserver.com"
LOG_DIR="/path/to/scan/logs"
LOG_FILE="nikto_$(date +%Y%m%d_%H%M%S).log"

mkdir -p "$LOG_DIR"
nikto -h "$TARGET_URL" -o "$LOG_DIR/$LOG_FILE"
```
- Replace http://yourserver.com with the actual URL or IP address of your server and /path/to/scan/logs with the desired location for the log files.

Give execution permissions to the script:
```bash
chmod +x run_nikto_scan.sh
```
Add the script as a cron job. Run crontab -e and add a line at the end of the file like the following:

```cron
0 2 * * * /path/to/run_nikto_scan.sh
```
This line runs the script every day at 2 a.m. Replace /path/to/run_nikto_scan.sh with the actual path to your script.

Save the file and exit the editor. The cron job will now automatically run the script at the specified time and save the results in the specified log files.

### Example

To manually execute the run_nikto_scan.sh script, navigate to the directory where the script is located and run the following command:

```bash
./run_nikto_scan.sh
```
Copyright Volkan Sah
