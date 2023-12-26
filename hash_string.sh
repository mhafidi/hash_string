#!/bin/bash

# Function to display the help menu
show_help() {
    echo "Usage: $0 -s <string> -a <algorithm> -t <hash type> [-o <tag>]"
    echo "Algorithms can be md5 or sha."
    echo "Hash type can be 64 or 256."
    echo
    echo "Options:"
    echo "  -s, --string    String to be hashed."
    echo "  -a, --algorithm Hash algorithm (md5 or sha)."
    echo "  -t, --type      Hash type (64 or 256)."
    echo "  -o, --tag       Optional tag to append to the hash."
    echo "  -h, --help      Display this help message."
    echo
    echo "Example:"
    echo "  $0 -s 'Your String Here' -a sha -t 64       # SHA 64-bit hash"
    echo "  $0 -s 'Your String Here' -a md5 -t 256      # MD5 256-bit hash"
    echo "  $0 -s 'Your String Here' -a sha -t 64 -o tag # SHA 64-bit hash with a tag"
}

# Function to hash a string
hash_string() {
    local input_string="$1"
    local algorithm="$2"
    local hash_type="$3"
    local tag="$4"

    local hash_output
    case $algorithm in
        md5)
            hash_function="md5sum"
            ;;
        sha)
            hash_function="sha256sum"
            ;;
        *)
            echo "Invalid algorithm: $algorithm. Please choose md5 or sha."
            exit 1
            ;;
    esac

    case $hash_type in
        64)
            hash_output=$(echo -n "$input_string" | $hash_function | cut -c1-16)
            ;;
        256)
            hash_output=$(echo -n "$input_string" | $hash_function | cut -c1-64)
            ;;
        *)
            echo "Invalid hash type: $hash_type. Please choose 64 or 256."
            exit 1
            ;;
    esac

    if [ -n "$tag" ]; then
        echo "$hash_output:$tag"
    else
        echo "$hash_output"
    fi
}

# Main program
while getopts ":s:a:t:o:h" opt; do
    case $opt in
        s) input_string=$OPTARG ;;
        a) algorithm=$OPTARG ;;
        t) hash_type=$OPTARG ;;
        o) tag=$OPTARG ;;
        h) show_help
           exit 0 ;;
        \?) echo "Invalid option -$OPTARG" >&2
            show_help
            exit 1 ;;
    esac
done

if [ -z "$input_string" ] || [ -z "$algorithm" ] || [ -z "$hash_type" ]; then
    show_help
    exit 1
fi

hashed_string=$(hash_string "$input_string" "$algorithm" "$hash_type" "$tag")
echo "Hashed string: $hashed_string"

