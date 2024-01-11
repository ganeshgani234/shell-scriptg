#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 100 ]
then 
    echo "Given number $NUMBER is greter than 100"
else
    echo "Given number $NUMBER is not greter than 100"
fi