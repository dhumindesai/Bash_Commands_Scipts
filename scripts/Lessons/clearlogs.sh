#!/bin/bash
# this script clears the contents from message file and copy it to message.log file
# usage ./clearlogs.sh

cp message message.log

>  message

echo 'message file has been cleared and copied to message.log'

