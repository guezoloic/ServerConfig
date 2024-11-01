# AWS Backup Script

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [How It Works](#how-it-works)
- [Troubleshooting](#troubleshooting)

## Overview

This Bash script automates the process of backing up files and directories to an Amazon S3 bucket. It reads paths from a backup file, checks their existence, and synchronizes them to a specified AWS server using the AWS CLI.

## Features

- Synchronizes files and directories to an S3 bucket.
- Creates a backup file if it does not exist.
- Logs errors and success messages to a specified log file.
- Supports deletion of files from S3 if they no longer exist in the source.

## Prerequisites

Before using this script, ensure you have:

- **Bash**: The script is written for a Bash environment.
- **AWS CLI**: Install the [AWS Command Line Interface](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and configure it with your credentials and default region.
- **Permissions**: The script requires appropriate permissions to read from the specified directories and write to the log file.

## Installation

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Ensure the script is executable**:
    ```bash
    chmod +x ./save-aws.sh
    ```

## Configuration

Before running this script, update the following variables in the script:

- **DIR**: Set this to the parent directory of your program. This is where your backup file will be created.
    ```bash
    DIR="<Program Directory>"
    ```

- **AWS**: Set this to your AWS S3 bucket name.
    ```bash
    AWS="<AWS-server Name>"
    ```

- **BACKUP**: This is the path where the backup file will be created. By default, it is set to "$DIR/backup_file.bak".

- **LOG**: Set the path where you want to save the log file. The default is set to /var/log/save-aws.log.

## Usage

1. **Create a backup file**:
The script requires a backup file (backup_file.bak) that contains the list of directories or files to be backed up. Each path should be on a new line.

2. **Run the script**:
Execute the script by running the following command in your terminal:

    ```bash
    ./backup_script.sh
    ```

## How It Works

1. **Backup File Check**: The script first checks if the backup file exists. If not, it creates one and logs an error.

2.	**Read Paths**: It reads each line from the backup file and checks if the path is a directory or file.

3.	**Synchronization**: For valid paths, the script uses aws s3 sync to synchronize the files to the specified S3 bucket.

4.	**Logging**: It logs any errors encountered during execution and confirms successful synchronization.

5.	**Exit Codes**: The script exits with a status code of 1 in case of an error and logs appropriate messages.

## Troubleshooting

- If the script fails, check the log file at the specified path for detailed error messages.

- Ensure that the AWS CLI is configured correctly and that you have the necessary permissions to access the S3 bucket.
