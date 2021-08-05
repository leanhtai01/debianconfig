#!/bin/bash

set -e

dpkg --add-architecture i386
apt update && apt full-upgrade -y
