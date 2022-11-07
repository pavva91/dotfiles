#!/bin/bash

history | awk '{ print $2 }' | uniq -c | sort -nr | head -10
