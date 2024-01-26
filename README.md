Namada Docker Image Auto-Installer

Installation Guide
This guide will walk you through the installation process of running a Namada Docker image using the Auto-Installer script on Ubuntu.

Step 1: Open Terminal
Open a terminal on your Ubuntu system. You can find it in your applications menu or press Ctrl + Alt + T.

Step 2: Download the Script
Download the script from the GitHub repository using wget or curl.

Using wget:


wget https://raw.githubusercontent.com/avocadodefi/Namada-Docker-Image-Auto-Installer/main/namada_setup.sh
Or, using curl:


curl -O https://raw.githubusercontent.com/avocadodefi/Namada-Docker-Image-Auto-Installer/main/namada_setup.sh
Step 3: Make the Script Executable
Make the script executable before running it:


chmod +x namada_setup.sh
Step 4: Run the Script
Run the script with superuser privileges:

sudo ./namada_setup.sh
Follow the on-screen instructions. The script will check if Docker is installed, install it if necessary, pull the specified Namada Docker image, and run it with the commands you specify.
