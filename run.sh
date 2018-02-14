#!/bin/bash

cd ${WORKSPACE}/
ls -l
echo "Running with Java Paramaters: -Xms${XMS} -Xmx${XMX}"

echo '** running corpus debugger against corpus **'
java -Xms${XMS} -Xmx${XMX} -jar corpusdebugger.jar ${CORPUS} i 1 2 elk ${DATAOUT}

echo '** running inference analysis against corpus **'
echo "Excluded due to memory requirements"
#java -Xms${XMS} -Xmx${XMX} -jar inferenceanalysis.jar ${CORPUS} i ${DATAOUT}

echo '** running patternextract against corpus **'
java -Xms${XMS} -Xmx${XMX} -jar patternextract.jar ${CORPUS} ${DATA}/branches.txt is ${DATAOUT} ${SAMPLESIZE}

echo '** Copy Analysis scripts into data dir **'
cp ${WORKSPACE}/pattern_analysis.Rmd ${DATAOUT}/pattern_analysis.Rmd
