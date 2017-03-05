#!/bin/bash

function run {
	INPUT=money_test${1}.dl

	if [ ! -f $INPUT ]
	then
		echo "Skipping test case ${1} because $INPUT does not exist."
		return
	fi

	echo "${1}:"
	dlv -N=2 -silent -filter=UNCOMPUTED_d4,UNCOMPUTED_d5,UNEXPECTED_d4,UNEXPECTED_d5,DUPLICATED_d4,DUPLICATED_d5,d4,d5 $DLV_OPTS $INPUT money.dl money_test_network.dl
	echo
}

if [ "$#" -eq 0 ]; then
	for i in $(seq 1 8)
	do
		run $i
	done
else
	run $1
fi
