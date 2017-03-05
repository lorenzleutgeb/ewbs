#!/bin/bash

function run {
	INPUT=course_test${1}.dl

	if [ ! -f $INPUT ]
	then
		echo "Skipping test case ${1} because $INPUT does not exist."
		return
	fi

	echo "${1}:"
	dlv -pfilter=scheduled $DLV_OPTS course_test${1}.dl course_guess.dl course_check.dl
	echo
}

if [ "$#" -eq 0 ]; then
	for i in $(seq 1 5)
	do
		run $i
	done
else
	run $1
fi
