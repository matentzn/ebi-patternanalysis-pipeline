#!/bin/bash

java_params=$@

cd ${WORKSPACE}/
ls -l

echo '** running corpus debugger against corpus **'
java $java_params -jar corpusdebugger.jar ${CORPUS} i 1 2 elk ${DATAOUT}

echo '** running inference analysis against corpus **'
#echo "Excluded due to memory requirements"
java  $java_params -jar inferenceanalysis.jar ${CORPUS} i ${DATAOUT}

echo '** running patternextract against corpus **'
java  $java_params -jar patternextract.jar ${CORPUS} ${DATA}/branches.txt is ${DATAOUT}

echo '** Copy Analysis scripts into data dir **'
cp ${WORKSPACE}/pattern_analysis.Rmd ${DATAOUT}/pattern_analysis.Rmd
