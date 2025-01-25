#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Start two processes that write to the files concurrently
(while true; do echo "process 1" >> file1.txt; sleep 0.1; done) &
(while true; do echo "process 2" >> file2.txt; sleep 0.1; done) &

# Wait for a while
sleep 2

# Print the content of the files
cat file1.txt
cat file2.txt

# kill both background processes
kill %1
kill %2

# Race condition - this process might be killed and lose data.
# The output may vary depending on how the processes are scheduled.