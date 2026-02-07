#!/bin/bash

# Phase 2: Log Ingestion and HDFS Block Analysis
: 'Task 2: Small Log File Storage
You are provided with a small access log file containing the given log structure.
Actions:
1. Upload the file to HDFS
2. Identify how many HDFS blocks are created
3. Analyze block allocation behavior for small files
Expected Analysis:
1. Explain why the observed number of blocks is created
2. Discuss inefficiencies related to small files in HDFS
'

echo "Small Log File Storage and analysis"
# Shell variables 
S_HDFS_BASE_DIR=/small-log-file-analytics
S_INPUT_DIR=/small-log-file-analytics/input
S_LOCAL_LOG_FILE=Downloads/logfiles.log

# Step-1: Create HDFS input directory
echo "Creating HDFS input directory..."
hdfs dfs -mkdir -p $S_INPUT_DIR

# Step-2: List root directories
echo "Listing HDFS root..."
hdfs dfs -ls /

# Step-3: Upload log file
echo "Uploading log file to HDFS..."
hdfs dfs -put -f $S_LOCAL_LOG_FILE $S_INPUT_DIR

# Step-4: Verify upload
echo "Verifying uploaded file..."
hdfs dfs -ls -h $S_INPUT_DIR

# Step-5: Analyze HDFS blocks
echo "Running HDFS FSCK (block analysis)..."
hdfs fsck $S_INPUT_DIR/logfiles.log -files -blocks

echo "Small log file execution and Analysis completed"


# 1. Explain why the observed number of blocks is created
# Ans: The file is split into blocks because its size exceeds the configured HDFS block size of 128 MB, 
# resulting in one full block and one partially filled block.

# 2. Discuss inefficiencies related to small files in HDFS
# Ans: Small files in HDFS cause high NameNode metadata overhead, poor storage utilization, 
# and inefficient MapReduce processing.

: '
Task 3: Large Log File Scalability Test
The system starts aggregating logs from multiple services, resulting in a large log file (1 GB or more).
Actions:
1. Generate or simulate a large log file using the same log structure
2. Upload the file to HDFS
3. Verify that the file is split into multiple blocks
Constraints:
1. HDFS block size must be configured to 128 MB
Expected Analysis:
2. Determine the number of blocks created
3. Explain how block size impacts parallelism, storage, and fault tolerance
'

echo "Large Log File Storage and analysis"
# Shell variables 
L_HDFS_BASE_DIR=/large-log-file-analytics
L_INPUT_DIR=/large-log-file-analytics/input
L_LOCAL_LOG_FILE=Downloads/access.log

# Step-1: Create HDFS input directory
echo "Creating HDFS input directory..."
hdfs dfs -mkdir -p $L_INPUT_DIR

# Step-2: List root directories
echo "Listing HDFS root..."
hdfs dfs -ls /

# Step-3: Upload log file
echo "Uploading log file to HDFS..."
hdfs dfs -D dfs.blocksize=134217728 -put -f $L_LOCAL_LOG_FILE $L_INPUT_DIR

# Step-4: Verify upload
echo "Verifying uploaded file..."
hdfs dfs -ls -h $L_INPUT_DIR

# Step-5: Analyze HDFS blocks
echo "Running HDFS FSCK (block analysis)..."
hdfs fsck $L_INPUT_DIR/access.log -files -blocks

echo "Large log file execution and Analysis completed"
