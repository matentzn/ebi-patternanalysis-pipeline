#!/bin/bash


echo '** running corpus debugger against corpus **'
cd ${WORKSPACE}/corpusdebugger/target
ls -l
#java ${JAVA_OPTS} -jar corpus.debugger-1.0-jar-with-dependencies.jar /data/corpus i 1 2 ${DATA}/

echo '** running inference analysis against corpus **'
cd ${WORKSPACE}/ontologyinferenceanalysis/target
ls -l
echo "Excluded due to memory requirements"
#java ${JAVA_OPTS} -jar ontology.inferenceanalysis-1.0-jar-with-dependencies.jar i ${DATA}/

echo '** running patternextract against corpus **'
cd ${WORKSPACE}/patternextract/target
ls -l
java ${JAVA_OPTS} -jar pattern.extract-1.0-jar-with-dependencies.jar /data/corpus ${DATA}/branches.txt i /data/

cd /data/
Rscript -e "library(knitr); knit('pattern_analysis.Rmd')"
