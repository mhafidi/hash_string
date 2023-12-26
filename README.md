# Enhanced Hashing Script

This script allows you to generate a hash of a given string using different algorithms (MD5 or SHA-256) and hash lengths (64-bit or 256-bit). You can also append an optional tag to the hashed output.

## Prerequisites

- Bash shell
- Access to `md5sum` and `sha256sum` utilities (commonly available in Unix-like systems)

## Installation

1. Download the script `hash_string.sh`.
2. Make the script executable:
   ```bash
   chmod +x hash_string.sh

## Examples

- Generate a SHA-256 64-bit hash:    
    ```bash
   ./hash_string.sh -s "Your String Here" -a sha -t 64

- Generate an MD5 256-bit hash:
    ```bash
    ./hash_string.sh -s "Your String Here" -a md5 -t 256

- Generate a SHA-256 64-bit hash with a tag:
    ```bash
    ./hash_string.sh -s "Your String Here" -a sha -t 64 -o "MyTag"
	

