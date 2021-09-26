#!/bin/bash

set -e

# ask for username
if [ -z $username ]
then
    read -e -p "Enter username: " username
fi
