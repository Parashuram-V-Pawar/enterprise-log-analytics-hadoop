 #!/bin/bash

# HDFS DIRECTORIES
INPUT_DIR=/large-log-file-analytics/input
OUTPUT_DIR=/large-log-file-analytics/output-streaming

# LOCAL SCRIPT PATHS
MAPPER=large-log-file-analyzer-mapper.py
REDUCER=large-log-file-analyzer-reducer.py

# CLEAN OLD OUTPUT
echo "Removing old HDFS output directory..."
hdfs dfs -rm -r -f $OUTPUT_DIR

# RUN HADOOP STREAMING JOB
echo "Running Hadoop Streaming job..."

hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
-files $MAPPER,$REDUCER \
-mapper "python3 $MAPPER" \
-reducer "python3 $REDUCER" \
-input $INPUT_DIR \
-output $OUTPUT_DIR

# VERIFY OUTPUT
echo "Streaming job output (first 20 lines):"
hdfs dfs -cat $OUTPUT_DIR/part-00000 | head -20

echo "Hadoop Streaming job completed successfully."

