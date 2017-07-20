#!/bin/bash

MYVAR=322

python <<EndofSession
for num in range(10):
	print $MYVAR
EndofSession

echo done
