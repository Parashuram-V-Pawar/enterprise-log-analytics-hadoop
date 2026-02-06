#!/bin/bash

echo "Starting Hadoop services..."
# 12. START HADOOP SERVICES
start-dfs.sh
start-yarn.sh

# 13. VERIFY
echo "Running jps..."
jps

echo "For Web UI open following in browser"
echo "Web UI:"
echo "NameNode -> http://localhost:9870"
echo "YARN     -> http://localhost:8088"