#!/bin/bash
uname -r | awk -F "-" '{print $1}'
