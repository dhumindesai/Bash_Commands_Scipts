#!bin/bash

echo '$1' arrgument is $1 and '$2' argument is $2
echo '$@'all args are $@
echo '$#' no of args $#
echo '$*' gives $*
echo '$0' gives $0

for i in $*
do
	echo $i
done

exit 0
