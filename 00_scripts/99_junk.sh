#!/usr/bin/env bash

WORKING_DIRECTORY=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/07_Rhabdastrella_globostellata_microbiome/Rhabdastrella_globostellata_microbiome/05_QIIME2
OUTPUT=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/07_Rhabdastrella_globostellata_microbiome/Rhabdastrella_globostellata_microbiome/05_QIIME2/visual


cd $WORKING_DIRECTORY

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10

qiime metadata tabulate \
  --m-input-file SampleData.qza \
  --o-visualization SampleData.qzv
