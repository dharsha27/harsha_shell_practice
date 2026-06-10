#!/bin/bash

NUM=$1


if [ $NUM -ge 20 ]; then  
   echo "The give $NUM is greater than this  number is :20"

elif [ $NUM -eq 20 ] ; then
   
   echo "The give $NUM is equal to :20"
else
    
      echo "The give $NUM is less than :20"
fi