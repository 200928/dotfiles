#!/bin/bash
amixer sget Capture | awk -F "[][]" ' /Left:/ { print $2 }'
