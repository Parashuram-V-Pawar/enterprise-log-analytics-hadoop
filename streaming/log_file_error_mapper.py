#!/usr/bin/env python3
import sys
import re

log_pattern = re.compile(
    r'^(\S+) \S+ \S+ \[([^\]]+)\] "(\S+) ([^"]+) (\S+)" (\d{3}) (\S+)'
)

for line in sys.stdin:
    match = log_pattern.match(line)
    if not match:
        continue

    status_code = int(match.group(6))
    endpoint = match.group(4)

    if status_code >= 400:
        print(f"{status_code}\t1")
        print(f"{endpoint}\t1")