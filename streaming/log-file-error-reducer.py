#!/usr/bin/env python3
import sys

current_key = None
current_count = 0

for line in sys.stdin:
    line = line.strip()
    if not line:
        continue

    try:
        key, value = line.split("\t", 1)
    except ValueError:
        continue  
    if key == current_key:
        current_count += 1
    else:
        if current_key is not None:
            print(f"{current_key}\t{current_count}")
        current_key = key
        current_count = 1

if current_key is not None:
    print(f"{current_key}\t{current_count}")
