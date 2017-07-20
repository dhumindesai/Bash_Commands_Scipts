#!/bin/bash

MYDATE=$(date +%d-%m-%y)

echo The day is $(MYDATE##-)
echo The month is $(MYDATE:-..-)
echo The year is $(MYDATE%-)

exit 0
