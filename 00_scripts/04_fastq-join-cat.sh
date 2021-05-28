#!/usr/bin/env bash

WORKING_DIRECTORY=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/07_Rhabdastrella_globostellata_microbiome/Rhabdastrella_globostellata_microbiome/03_cleaned_data
OUTPUT=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/07_Rhabdastrella_globostellata_microbiome/Rhabdastrella_globostellata_microbiome/03_cleaned_data

# Here the WORKING_DIRECTORY and the OUTPUT is the same
# I only try to deal with the V1V3 - V3V4 combinaison

cd $WORKING_DIRECTORY

# By join technic (for "normal" sequences and for "+" sequences)
# So will be analysed like Single End

fastq-join BRG1V1_R1.paired.fastq.gz BRG1V3_R2.paired.fastq.gz BRG1V3_R1.paired.fastq.gz BRG1V4_R2.paired.fastq.gz -o $OUTPUT/BRG1_joined.fastq.gz
fastq-join BRG1V1_R1.paired.fastq.gz BRG1V3_R2.paired.fastq.gz BRG1V3+_R1.paired.fastq.gz BRG1V4+_R2.paired.fastq.gz -o $OUTPUT/BRG1+_joined.fastq.gz

fastq-join BRG2V1_R1.paired.fastq.gz BRG2V3_R2.paired.fastq.gz BRG2V3_R1.paired.fastq.gz BRG2V4_R2.paired.fastq.gz -o $OUTPUT/BRG2_joined.fastq.gz
fastq-join BRG2V1_R1.paired.fastq.gz BRG2V3_R2.paired.fastq.gz BRG2V3+_R1.paired.fastq.gz BRG2V4+_R2.paired.fastq.gz -o $OUTPUT/BRG2+_joined.fastq.gz

fastq-join BRG3V1_R1.paired.fastq.gz BRG3V3_R2.paired.fastq.gz BRG3V3_R1.paired.fastq.gz BRG3V4_R2.paired.fastq.gz -o $OUTPUT/BRG3_joined.fastq.gz
fastq-join BRG3V1_R1.paired.fastq.gz BRG3V3_R2.paired.fastq.gz BRG3V3+_R1.paired.fastq.gz BRG3V4+_R2.paired.fastq.gz -o $OUTPUT/BRG3+_joined.fastq.gz

# By cat technic (for "normal" sequences and for "+" sequences)
# So will be analysed like Paired End

cat BRG1V1_R1.paired.fastq.gz BRG1V3_R1.paired.fastq.gz > BRG1_R1_cat.fastq.gz
cat BRG1V3_R2.paired.fastq.gz BRG1V4_R2.paired.fastq.gz > BRG1_R2_cat.fastq.gz

cat BRG2V1_R1.paired.fastq.gz BRG2V3_R1.paired.fastq.gz > BRG2_R1_cat.fastq.gz
cat BRG2V3_R2.paired.fastq.gz BRG2V4_R2.paired.fastq.gz > BRG2_R2_cat.fastq.gz

cat BRG3V1_R1.paired.fastq.gz BRG3V3_R1.paired.fastq.gz > BRG3_R1_cat.fastq.gz
cat BRG3V3_R2.paired.fastq.gz BRG3V4_R2.paired.fastq.gz > BRG3_R2_cat.fastq.gz

