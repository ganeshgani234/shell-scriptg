#!/bin/bash

NUMBER1=$1
NUMBER2=$2

SUM=$(($NUMBER1+$NUMBER2))

echo "Total:: $SUM"

echo "How many orgs passed:: $#"

echo "ALL args passed:: $@"

echo "Script name:: $0"
