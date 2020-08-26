#!/bin/sh -l

time=$(date)
echo "$time"

docker cp asg200_hlapp:/build .

cd /build

