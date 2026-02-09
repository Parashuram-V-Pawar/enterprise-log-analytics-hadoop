#!/bin/bash

: '
Phase 5: Log-Specific Analytical Enhancements
Task 6: Error-Focused Log Analysis
Extend the MapReduce logic to analyze only error-related requests.
Definition:
HTTP status codes greater than or equal to 400
Expected Output:
Frequency of error status codes
Frequency of error-generating endpoints
Analysis:
Justify mapper and reducer design decisions
Explain how filtering impacts job performance
'

INPUT_DIR=/large-log-file-analytics/input
OUTPUT_DIR=/large-log-file-analytics/output_error_analysis

ERROR_MAPPER=./streaming/log-file-error-mapper.py
ERROR_REDUCER=./streaming/log-file-error-reducer.py

# Remove old output
hdfs dfs -rm -r -f $OUTPUT_DIR

# Run Hadoop Streaming job
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
-files $ERROR_MAPPER,$ERROR_REDUCER \
-mapper log-file-error-mapper.py \
-reducer log-file-error-reducer.py \
-input $INPUT_DIR \
-output $OUTPUT_DIR

# Display output
echo "Error Analysis Output:"
hdfs dfs -cat $OUTPUT_DIR/part-00000 

