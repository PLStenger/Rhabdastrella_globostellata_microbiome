#!/usr/bin/env bash

WORKING_DIRECTORY=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/07_Rhabdastrella_globostellata_microbiome/Rhabdastrella_globostellata_microbiome/05_QIIME2
OUTPUT=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/07_Rhabdastrella_globostellata_microbiome/Rhabdastrella_globostellata_microbiome/05_QIIME2/visual

# Aim: construct a rooted phylogenetic tree

cd $WORKING_DIRECTORY

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10

#carry out a multiple seqeunce alignment using Mafft
 qiime alignment mafft \
  --i-sequences RepSeq.qza \
  --o-alignment aligned-RepSeq.qza

#mask (or filter) the alignment to remove positions that are highly variable. These positions are generally considered to add noise to a resulting phylogenetic tree.
qiime alignment mask \
  --i-alignment aligned-RepSeq.qza \
  --o-masked-alignment masked-aligned-RepSeq.qza

#create the tree using the Fasttree program
qiime phylogeny fasttree \
  --i-alignment masked-aligned-RepSeq.qza \
  --o-tree unrooted-tree.qza

#root the tree using the longest root
qiime phylogeny midpoint-root \
  --i-tree unrooted-tree.qza \
  --o-rooted-tree rooted-tree.qza
  
#export the tree  
qiime tools export \
  --input-path unrooted-tree.qza \
  --output-path $OUTPUT
  
# This out put is in Newick format, see http://scikit-bio.org/docs/latest/generated/skbio.io.format.newick.html  
# See it on https://itol.embl.de

