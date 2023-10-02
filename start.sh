#!/bin/bash

cd /home/docker/actions-runner

./config.sh --url https://github.com/anjana-radhakrishnan/test-pipeline --token A2SU7U7AKIA6QKHQFSYK3K3FDLDHK

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token A2SU7U7AKIA6QKHQFSYK3K3FDLDHK
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!
