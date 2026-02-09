#!/bin/bash

echo "Stopping Hadoop services..."
# 1. STOP HADOOP SERVICES
stop-yarn.sh
stop-dfs.sh 

# 2. VERIFY
echo "Verifying stopped services..."
jps

echo "All Hadoop services stopped..."