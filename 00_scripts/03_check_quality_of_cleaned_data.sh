#!/usr/bin/env bash

# installing FastQC from https://www.bioinformatics.babraham.ac.uk/projects/download.html
# FastQC v0.11.9 (Mac DMG image)

# Correct tool citation : Andrews, S. (2010). FastQC: a quality control tool for high throughput sequence data.

WORKING_DIRECTORY=/scratch_vol1/fungi/Rhabdastrella_globostellata_microbiome/03_cleaned_data
OUTPUT=/scratch_vol1/fungi/Rhabdastrella_globostellata_microbiome/04_quality_check


cd $WORKING_DIRECTORY

for FILE in $(ls $WORKING_DIRECTORY/*.fastq.gz)
do
      fastqc $FILE -o $OUTPUT
done ;


