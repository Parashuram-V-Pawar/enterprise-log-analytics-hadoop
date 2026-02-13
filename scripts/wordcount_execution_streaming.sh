 #!/bin/bash

: '
Phase 4: Custom MapReduce Implementation Using Python
Task 5: Python WordCount Using Hadoop Streaming
The engineering team prefers Python for rapid development and flexibility.
Actions:
1. Implement a WordCount MapReduce job using Python
2. Ensure compatibility with Hadoop Streaming
3. Execute the job on the same HDFS input data
Comparison:
1. Compare the Python implementation with the built-in WordCount job
2. Discuss differences in performance, flexibility, and execution overhead
'
# HDFS DIRECTORIES
INPUT_DIR=/small-log-file-analytics/input
OUTPUT_DIR=/small-log-file-analytics/output-streaming

# LOCAL SCRIPT PATHS
MAPPER=streaming/log_file_analyzer_mapper.py
REDUCER=streaming/log_file_analyzer_reducer.py

# CLEAN OLD OUTPUT
echo "Removing old HDFS output directory..."
hdfs dfs -rm -r -f $OUTPUT_DIR

# RUN HADOOP STREAMING JOB
echo "Running Hadoop Streaming job..."

hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
-files $MAPPER,$REDUCER \
-mapper "python3 log_file_analyzer_mapper.py" \
-reducer "python3 log_file_analyzer_reducer.py" \
-input $INPUT_DIR \
-output $OUTPUT_DIR

# VERIFY OUTPUT
echo "Streaming job output (first 20 lines):"
hdfs dfs -cat $OUTPUT_DIR/part-00000

echo "Hadoop Streaming job completed successfully."

