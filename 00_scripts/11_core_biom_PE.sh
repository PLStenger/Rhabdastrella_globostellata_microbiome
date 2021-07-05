#!/usr/bin/env bash

WORKING_DIRECTORY=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/07_Rhabdastrella_globostellata_microbiome/Rhabdastrella_globostellata_microbiome/05_QIIME2
OUTPUT=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/07_Rhabdastrella_globostellata_microbiome/Rhabdastrella_globostellata_microbiome/05_QIIME2/visual

DATABASE=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/07_Rhabdastrella_globostellata_microbiome/Rhabdastrella_globostellata_microbiome/98_database_files

###############################################################
### For Bacteria
###############################################################

cd $WORKING_DIRECTORY

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p subtables
mkdir -p export/subtables

# Aim: Filter sample from table based on a feature table or metadata

qiime feature-table filter-samples \
        --i-table core/RarTable.qza \
        --m-metadata-file $DATABASE/sample-metadata.tsv \
        --p-where "[#SampleID] IN ('Sp-1A-V1V3', 'Sp-1B-V1V3', 'Sp-1C-V1V3', 'Sp-2A-V1V3', 'Sp-2B-V1V3', 'Sp-2C-V1V3', 'Sp-3A-V1V3', 'Sp-3B-V1V3', 'Sp-3C-V1V3', 'Sp-4-V4', 'Sp-5-V4', 'Sp-6-V4', 'Sp-4-V1V3', 'Sp-5-V1V3', 'Sp-6-V1V3', 'Sp-4-V1V3V4', 'Sp-5-V1V3V4', 'Sp-6-V1V3V4')"  \
        --o-filtered-table subtables/RarTable-all.qza
 
qiime feature-table filter-samples \
       --i-table core/Table.qza \
       --m-metadata-file $DATABASE/sample-metadata.tsv \
       --p-where "[#SampleID] IN ('Sp-1A-V1V3', 'Sp-1B-V1V3', 'Sp-1C-V1V3', 'Sp-2A-V1V3', 'Sp-2B-V1V3', 'Sp-2C-V1V3', 'Sp-3A-V1V3', 'Sp-3B-V1V3', 'Sp-3C-V1V3', 'Sp-4-V4', 'Sp-5-V4', 'Sp-6-V4', 'Sp-4-V1V3', 'Sp-5-V1V3', 'Sp-6-V1V3', 'Sp-4-V1V3V4', 'Sp-5-V1V3V4', 'Sp-6-V1V3V4')"  \
       --o-filtered-table subtables/Table-all.qza
       
qiime feature-table filter-samples \
       --i-table core/RepSeq.qza \
       --m-metadata-file $DATABASE/sample-metadata.tsv \
       --p-where "[#SampleID] IN ('Sp-1A-V1V3', 'Sp-1B-V1V3', 'Sp-1C-V1V3', 'Sp-2A-V1V3', 'Sp-2B-V1V3', 'Sp-2C-V1V3', 'Sp-3A-V1V3', 'Sp-3B-V1V3', 'Sp-3C-V1V3', 'Sp-4-V4', 'Sp-5-V4', 'Sp-6-V4', 'Sp-4-V1V3', 'Sp-5-V1V3', 'Sp-6-V1V3', 'Sp-4-V1V3V4', 'Sp-5-V1V3V4', 'Sp-6-V1V3V4')"  \
       --o-filtered-table subtables/RepSeq-all.qza       

# Aim: Identify "core" features, which are features observed,
     # in a user-defined fraction of the samples
        
qiime feature-table core-features \
        --i-table subtables/RarTable-all.qza \
        --p-min-fraction 0.1 \
        --p-max-fraction 1.0 \
        --p-steps 10 \
        --o-visualization visual/CoreBiom-all.qzv  
        
qiime feature-table core-features \
        --i-table subtables/Table-all.qza \
        --p-min-fraction 0.1 \
        --p-max-fraction 1.0 \
        --p-steps 10 \
        --o-visualization visual/CoreBiom-Table-all.qzv  
                
qiime feature-table core-features \
        --i-table subtables/RepSeq-all.qza \
        --p-min-fraction 0.1 \
        --p-max-fraction 1.0 \
        --p-steps 10 \
        --o-visualization visual/CoreBiom-RepSeq-all.qzv          
        
        
qiime tools export --input-path subtables/RarTable-all.qza --output-path export/subtables/RarTable-all    
qiime tools export --input-path visual/CoreBiom-all.qzv --output-path export/visual/CoreBiom-all
biom convert -i export/subtables/RarTable-all/feature-table.biom -o export/subtables/RarTable-all/table-from-biom.tsv --to-tsv
sed '1d ; s/\#OTU ID/ASV_ID/' export/subtables/RarTable-all/table-from-biom.tsv > export/subtables/RarTable-all/ASV.tsv

qiime tools export --input-path subtables/Table-all.qza --output-path export/subtables/Table-all    
qiime tools export --input-path visual/CoreBiom-Table-all.qzv --output-path export/visual/CoreBiom-Table-all
biom convert -i export/subtables/Table-all/feature-table.biom -o export/subtables/Table-all/table-from-biom.tsv --to-tsv
sed '1d ; s/\#OTU ID/ASV_ID/' export/subtables/Table-all/table-from-biom.tsv > export/subtables/Table-all/ASV.tsv

qiime tools export --input-path subtables/RepSeq-all.qza --output-path export/subtables/RepSeq-all    
qiime tools export --input-path visual/CoreBiom-RepSeq-all.qzv --output-path export/visual/CoreBiom-RepSeq-all
biom convert -i export/subtables/RepSeq-all/feature-table.biom -o export/subtables/RepSeq-all/table-from-biom.tsv --to-tsv
sed '1d ; s/\#OTU ID/ASV_ID/' export/subtables/RepSeq-all/table-from-biom.tsv > export/subtables/RepSeq-all/ASV.tsv

              
        
        
