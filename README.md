# Log Analytics System for a Growing Enterprise
This project builds a local Hadoop-based system to ingest, store, and analyze growing web access logs using HDFS and MapReduce in order to study Hadoop’s scalability, fault tolerance, and performance in a real-world log analytics scenario.

## Project Overview
1. Local pseudo-distributed Hadoop cluster setup.
2. Web access log ingestion into HDFS.
3. HDFS block storage and scalability analysis.
4. Built-in MapReduce WordCount execution.
5. Custom Python MapReduce using Hadoop Streaming.
6. Error log analysis.
7. Hadoop architecture evolution.
8. Hadoop configuration and performance tuning.

## Tech Stack
```
Operatting System : Linux/Mac OS/ WSL for windows.
Platform : Apache Hadoop.
Storage : HDFS
Environment : Java JDK 8 or 11.
Programming Language : Python (for Streaming).
```

## Project Structure
```
enterprise-log-analyzer-hadoop /
|-- scripts /
|   |-- setup.sh
|   |-- start-hadoop.sh
|   |-- stop-hadoop.sh
|   |-- wordcount_execution_inbuilt.sh
|   |-- wordcount_execution_streaming.sh
|   |-- error_log_analysis.sh
|
|-- Streaming /
|   |-- log_file_analyzer_mapper.py
|   |-- log_file_analyzer_reducer.py
|   |-- log_file_error_mapper.py
|   |-- log_file_error_reducer.py
|
|-- docs /
|   |-- hadoop_architecture_evolution.txt
|   |-- configuration_and_performance_tuning.txt
|
|-- .gitignore
|-- README.md
|-- requirements.txt
```

## Installation
```
Clone the repository
-> git clone https://github.com/Parashuram-V-Pawar/enterprise-log-analytics-hadoop.git

Move to project folder
-> cd enterprise-log-analytics-hadoop

Install dependencies:
pip install -r requirements.txt

First download datasets from below links:
small_log_file : https://www.kaggle.com/datasets/avinhok/website-log-access
large_log_file : https://www.kaggle.com/datasets/eliasdabbas/web-server-access-logs?select=access.log

Then move this files to desired location and change the "*LOCAL_LOG_FILE" path in file_analyzer.sh according to your dataset path.

Now execute below commands in order:
1. ./scripts/setup.sh (install hadoop and set environment)
2. ./scripts/start-hadoop.sh (start hadoop services)
3. ./scripts/wordcount_execution_inbuilt.sh
4. ./scripts/wordcount_execution_streaming.sh
5. ./scripts/error_log_analysis.sh
6. ./scripts/stop-hadoop.sh (stop hadoop services)
```

## Author
```
Parashuram V Pawar
GitHub username: Parashuram-V-Pawar
```