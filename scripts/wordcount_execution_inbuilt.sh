#!/bin/bash

# Phase 3: Distributed Processing Using Built-in MapReduce
: '
Task 4: Built-in WordCount Execution
To validate distributed processing, run Hadoop’s built-in WordCount example on the log data stored in HDFS.
Requirements:
1. Input must be read from HDFS
2. Output must be written to HDFS
Analysis:
1. Identify the number of mapper tasks launched
2. Explain the relationship between input blocks and mapper count
3. Observe reducer execution and shuffle behavior
'


INPUT_DIR=/large-log-file-analytics/input
OUTPUT_DIR=/large-log-file-analytics/output


# ---- CLEAN OLD OUTPUT ----
echo "Removing old output directory if exists..."
hdfs dfs -rm -r -f $OUTPUT_DIR

# ---- RUN WORDCOUNT ----
echo "Running Hadoop WordCount job..."
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-*.jar \
wordcount \
$INPUT_DIR \
$OUTPUT_DIR

# ---- VERIFY OUTPUT ----
echo "Listing WordCount output in HDFS..."
hdfs dfs -ls $OUTPUT_DIR

echo "Displaying sample output:"
hdfs dfs -cat $OUTPUT_DIR/part-r-00000 | head -20

echo "WordCount job completed successfully."


# Analysis:
# 1. Identify the number of mapper tasks launched:
# Number of mapper tasks launched is equal to the number of blocks created. 
echo "Number of blocks created are: "
hdfs fsck $INPUT_DIR -files -blocks | grep "Total blocks"

# 2. Explain the relationship between input blocks and mapper count
# The relationship between input blocks and mapper count is that number of blocks directly equals number of mappers,
# because HDFS splits input file into fixed size blocks and each block is assigned a mapper by Hadoop.

# 3. Observe reducer execution and shuffle behavior
# During execution, mapper outputs are shuffled and sorted by key across the cluster. 
# The reducer receives grouped (word, count) pairs from all mappers and aggregates them to produce the final WordCount result.
# The shuffle phase ensures that all values for the same key are processed by the same reducer.