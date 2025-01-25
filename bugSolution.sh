#!/bin/bash

# This script demonstrates a solution to the race condition bug using a lock file.

# Create two files
touch file1.txt
touch file2.txt

# Function to write to file with locking
write_to_file() {
  local file=$1
  local message=$2
  # Acquire lock
  flock -x 200
  echo "$message" >> "$file"
  # Release lock
  flock -u 200
}

# Start two processes that write to the files concurrently
while true; do
  write_to_file file1.txt "process 1"
  sleep 0.1
done &
while true; do
  write_to_file file2.txt "process 2"
  sleep 0.1
done &

# Wait for a while
sleep 2

# Print the content of the files
cat file1.txt
cat file2.txt

# kill both background processes
kill %1
kill %2

# With proper locking, the race condition is resolved.