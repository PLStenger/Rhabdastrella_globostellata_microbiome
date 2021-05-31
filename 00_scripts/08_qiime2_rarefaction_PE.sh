#!/usr/bin/env bash

WORKING_DIRECTORY=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/07_Rhabdastrella_globostellata_microbiome/Rhabdastrella_globostellata_microbiome/05_QIIME2
OUTPUT=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/07_Rhabdastrella_globostellata_microbiome/Rhabdastrella_globostellata_microbiome/05_QIIME2/visual

# Aim: rarefy a feature table to compare alpha/beta diversity results

# A good forum to understand what it does :
# https://forum.qiime2.org/t/can-someone-help-in-alpha-rarefaction-plotting-depths/4580/16

cd $WORKING_DIRECTORY

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10

# Note: max-depth should be chosen based on Table.qzv

qiime diversity alpha-rarefaction \
  --i-table Table.qza \
  --i-phylogeny rooted-tree.qza \
  --p-max-depth 57509 \
  --m-metadata-file sample-metadata.tsv \
  --o-visualization $OUTPUT/alpha-rarefaction.qzv
  
# Note: Interpreting alpha diversity metrics: it is important to understand that certain metrics are stricly qualitative (presence/absence), 
# that is they only take diversity into account, often referred to as richness of the community (e.g. observed otus). 
# In contrast, other methods are quantitative in that they consider both richness and abundance across samples, commonly referred to as evenness (e.g. Shannon). 
# Yet other methods take phylogenetic distance into account by asking how diverse the phylogenetic tree is for each sample. 
# These phylogenetic tree-based methods include the popular Faith’s PD, which calculates the sum of the branch length covered by a sample
