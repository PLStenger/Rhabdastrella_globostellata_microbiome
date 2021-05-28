#!/usr/bin/env bash

# trimmomatic version 0.39
# trimmomatic manual : http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/TrimmomaticManual_V0.32.pdf

WORKING_DIRECTORY=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/07_Rhabdastrella_globostellata_microbiome/Rhabdastrella_globostellata_microbiome/01_raw_data
OUTPUT=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/07_Rhabdastrella_globostellata_microbiome/Rhabdastrella_globostellata_microbiome/03_cleaned_data

ADAPTERFILE=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/07_Rhabdastrella_globostellata_microbiome/Rhabdastrella_globostellata_microbiome/99_softwares/

# Arguments :
# ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150

cd $WORKING_DIRECTORY

# Sample BRG1 for 1) V1V3 marker, 2) V3V4 marker, 3) V3V4+ marker
trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/BRG1V1_R1.fastq $WORKING_DIRECTORY/BRG1V3_R2.fastq $OUTPUT/BRG1V1_R1.paired.fastq.gz $OUTPUT/BRG1V1_R1.single.fastq.gz $OUTPUT/BRG1V3_R2.paired.fastq.gz $OUTPUT/BRG1V3_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/BRG1V3_R1.fastq $WORKING_DIRECTORY/BRG1V4_R2.fastq $OUTPUT/BRG1V3_R1.paired.fastq.gz $OUTPUT/BRG1V3_R1.single.fastq.gz $OUTPUT/BRG1V4_R2.paired.fastq.gz $OUTPUT/BRG1V4_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/BRG1V3+_R1.fastq $WORKING_DIRECTORY/BRG1V4+_R2.fastq $OUTPUT/BRG1V3+_R1.paired.fastq.gz $OUTPUT/BRG1V3+_R1.single.fastq.gz $OUTPUT/BRG1V4+_R2.paired.fastq.gz $OUTPUT/BRG1V4+_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150

# Sample BRG2 for 1) V1V3 marker, 2) V3V4 marker, 3) V3V4+ marker
trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/BRG2V1_R1.fastq $WORKING_DIRECTORY/BRG2V3_R2.fastq $OUTPUT/BRG2V1_R1.paired.fastq.gz $OUTPUT/BRG2V1_R1.single.fastq.gz $OUTPUT/BRG2V3_R2.paired.fastq.gz $OUTPUT/BRG2V3_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/BRG2V3_R1.fastq $WORKING_DIRECTORY/BRG2V4_R2.fastq $OUTPUT/BRG2V3_R1.paired.fastq.gz $OUTPUT/BRG2V3_R1.single.fastq.gz $OUTPUT/BRG2V4_R2.paired.fastq.gz $OUTPUT/BRG2V4_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/BRG2V3+_R1.fastq $WORKING_DIRECTORY/BRG2V4+_R2.fastq $OUTPUT/BRG2V3+_R1.paired.fastq.gz $OUTPUT/BRG2V3+_R1.single.fastq.gz $OUTPUT/BRG2V4+_R2.paired.fastq.gz $OUTPUT/BRG2V4+_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150

# Sample BRG3 for 1) V1V3 marker, 2) V3V4 marker, 3) V3V4+ marker
trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/BRG3V1_R1.fastq $WORKING_DIRECTORY/BRG3V3_R2.fastq $OUTPUT/BRG3V1_R1.paired.fastq.gz $OUTPUT/BRG3V1_R1.single.fastq.gz $OUTPUT/BRG3V3_R2.paired.fastq.gz $OUTPUT/BRG3V3_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/BRG3V3_R1.fastq $WORKING_DIRECTORY/BRG3V4_R2.fastq $OUTPUT/BRG3V3_R1.paired.fastq.gz $OUTPUT/BRG3V3_R1.single.fastq.gz $OUTPUT/BRG3V4_R2.paired.fastq.gz $OUTPUT/BRG3V4_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/BRG3V3+_R1.fastq $WORKING_DIRECTORY/BRG3V4+_R2.fastq $OUTPUT/BRG3V3+_R1.paired.fastq.gz $OUTPUT/BRG3V3+_R1.single.fastq.gz $OUTPUT/BRG3V4+_R2.paired.fastq.gz $OUTPUT/BRG3V4+_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150


