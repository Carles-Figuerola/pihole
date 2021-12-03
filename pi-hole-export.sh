#!/bin/bash
# Script to stop immediately on non-zero exit code, carry exit code through
# pipe, and disallow unset variables
set -euo pipefail

OUTPUT=$(curl --silent --show-error --retry 10 --fail \
       http://localhost/admin/api.php?summaryRaw)
echo $OUTPUT
echo $OUTPUT | \
    jq -r 'to_entries |
           map(.key + " " + (.value | tostring)) |
           .[]' | \
    awk -v date=$(date +%s) '{print "pihole." $1 " " $2 " " date}' \
    >> /dev/tcp/192.168.11.101/2003

