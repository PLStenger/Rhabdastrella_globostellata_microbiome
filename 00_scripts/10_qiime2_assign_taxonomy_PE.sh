#!/usr/bin/env bash

WORKING_DIRECTORY=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/07_Rhabdastrella_globostellata_microbiome/Rhabdastrella_globostellata_microbiome/05_QIIME2
OUTPUT=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/07_Rhabdastrella_globostellata_microbiome/Rhabdastrella_globostellata_microbiome/05_QIIME2/visual

# Aim: classify reads by taxon using a fitted classifier

# https://docs.qiime2.org/2019.10/tutorials/moving-pictures/
# In this step, you will take the denoised sequences from step 5 (rep-seqs.qza) and assign taxonomy to each sequence (phylum -> class -> …genus -> ). 
# This step requires a trained classifer. You have the choice of either training your own classifier using the q2-feature-classifier or downloading a pretrained classifier.

# https://docs.qiime2.org/2019.10/tutorials/feature-classifier/


# Aim: Import data to create a new QIIME 2 Artifact
# https://gitlab.com/IAC_SolVeg/CNRT_BIOINDIC/-/blob/master/snk/12_qiime2_taxonomy


###############################################################
### For Bacteria
###############################################################

cd $WORKING_DIRECTORY

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10

qiime tools import --type 'FeatureData[Taxonomy]' \
  --input-format HeaderlessTSVTaxonomyFormat \
  --input-path /Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/data_input/Taxonomy-SILVA-V132-2018.04.10-99.txt \
  --output-path RefTaxo.qza

qiime tools import --type 'FeatureData[Sequence]' \
  --input-path /Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/data_input/Sequence-SILVA-V132-2018.04.10-99.fasta \
  --output-path DataSeq.qza

   
# Aim: Extract sequencing-like reads from a reference database.
# Warning: For v4 only !!! Not for its2 !!! 

# The --p-trunc-len parameter should only be used to trim reference sequences,
# if query sequences are trimmed to this same length or shorter.
 
# Paired sequences that successfully join will typically be variable in length.
# Single reads not truncated at a specific length may also be variable in length.

# For classification of paired-end reads and untrimmed single-end reads,
# we recommend training a classifier on sequences that have been extracted
# at the appropriate primer sites, but are not trimmed !!!
# -----
# The primer sequences used for extracting reads should be the actual DNA-binding
# (i.e., biological) sequence contained within a primer construct.

# It should NOT contain any non-biological, non-binding sequence,
# e.g., adapter, linker, or barcode sequences.

# If you aren't sure what section of your primer sequences are actual DNA-binding
# you should consult whoever constructed your sequencing library, your sequencing
# center, or the original source literature on these primers.

# If your primer sequences are > 30 nt long, they most likely contain some
# non-biological sequence !

qiime feature-classifier extract-reads --i-sequences DataSeq.qza \
        --p-f-primer 'GTGCCAGCMGCCGCGGTAA' \
        --p-r-primer 'TCCTCCGCTTATTGATATGC' \
        --o-reads RefSeq.qza 
        
        #--p-trunc-len {params.length} \
        

# Aim: Create a scikit-learn naive_bayes classifier for reads

qiime feature-classifier fit-classifier-naive-bayes \
  --i-reference-reads RefSeq.qza \
  --i-reference-taxonomy RefTaxo.qza \
  --o-classifier Classifier.qza

# Aim: Classify reads by taxon using a fitted classifier
# --p-reads-per-batch 1000

qiime feature-classifier classify-sklearn \
   --i-classifier Classifier.qza \
   --i-reads ConRepSeq.qza \
   --p-reads-per-batch 1000 \ 
   --p-n-jobs 6 \
   --o-classification Taxonomy_reads-per-batch_1000.qza

# Switch to https://chmi-sops.github.io/mydoc_qiime2.html#step-9-assign-taxonomy
# --p-reads-per-batch 0 (default)

qiime feature-classifier classify-sklearn \
  --i-classifier Classifier.qza \
  --i-reads RepSeq.qza \
  --o-classification taxonomy_reads-per-batch_0.qza

qiime metadata tabulate \
  --m-input-file taxonomy.qza \
  --o-visualization taxonomy_reads-per-batch_0.qzv

# Now create a visualization of the classified sequences.

qiime taxa barplot \
  --i-table Table.qza \
  --i-taxonomy taxonomy_reads-per-batch_0.qza \
  --m-metadata-file sample-metadata.tsv \
  --o-visualization taxa-bar-plots_reads-per-batch_0.qzv

qiime taxa barplot \
  --i-table Table.qza \
  --i-taxonomy Taxonomy_reads-per-batch_1000.qza \
  --m-metadata-file sample-metadata.tsv \
  --o-visualization Taxa-bar-plots_reads-per-batch_1000.qzv
