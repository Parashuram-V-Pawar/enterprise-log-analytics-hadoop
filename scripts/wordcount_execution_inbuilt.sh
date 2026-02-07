#!/bin/bash

INPUT_DIR=/small-log-file-analytics/input
OUTPUT_DIR=/small-log-file-analytics/output


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