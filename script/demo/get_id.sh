#!/bin/sh

NEW_UUID=cat /dev/urandom | head -1 | md5sum | head -c 16
printf $NEW_UUID