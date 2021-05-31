# Rhabdastrella_globostellata_microbiome

![graphical_summary_of_primers_map](https://github.com/PLStenger/Rhabdastrella_globostellata_microbiome/blob/main/99_images/primers_map.png)

![graphical_summary_of_sets_of_markers](https://github.com/PLStenger/Rhabdastrella_globostellata_microbiome/blob/main/99_images/five_set_of_markers.png)


### Installing pipeline :

First, open your terminal. Then, run these two command lines :

    cd -place_in_your_local_computer
    git clone https://github.com/PLStenger/Rhabdastrella_globostellata_microbiome.git

### Update the pipeline in local by :

    git pull
    
### If necessary, install softwares by :   

    cd 99_softwares/
    conda install -c bioconda fastqc
    conda install -c bioconda trimmomatic
    conda install -c bioconda multiqc

### Run scripts in local by :

    # Put you in your working directory
    cd /Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/07_Rhabdastrella_globostellata_microbiome/Rhabdastrella_globostellata_microbiome
    
    # Put you in bash language
    bash
    
    # Go in the script folder
    cd 00_script
    
    # Run the first script for check the quality of your data and then for choosing the good cleanning parameters
    time nohup bash 01_quality_check_by_FastQC.sh &> 01_quality_check_by_FastQC.out
    
        real	2m29.904s
        user	3m14.842s
        sys	    0m14.673s
    
    # Go out of the folder
    cd ..
    
    # Go in the "02_quality_check" folder
    cd 02_quality_check
    
    # Run multiqc for synthetized information
    multiqc .
    
    # Go out of the folder
    cd ..
    
    # Go in the script folder
    cd 00_script

    # Run the second script for cleaned your data
    time nohup bash 02_trimmomatic_q30.sh &> 02_trimmomatic_q30.out
    
        real	1m12.017s
        user	1m31.466s
        sys	    0m8.983s

    # Run the third script for checking the quality of your cleaned data 
    time nohup bash 03_check_quality_of_cleaned_data.sh &> 03_check_quality_of_cleaned_data.out

        real	5m5.974s
        user	5m42.971s
        sys	    0m27.492s
        
    # Go out of the folder
    cd ..
    
    # Go in the "04_quality_check" folder
    cd 04_quality_check
    
    # Run multiqc for synthetized information
    multiqc .
    
    # Go out of the folder
    cd ..
    
    # Go in the script folder
    cd 00_script
    
    # Try to deal with the V1V3 - V3V4 situation :
    time nohup bash 04_fastq-cat.sh &> 04_fastq-cat.out

        real	0m1.264s
        user	0m0.039s
        sys	    0m0.692s

    # Import the data in QIIME2 format
    time nohup bash 05_qiime2_import_PE.sh &> 05_qiime2_import_PE.out
    
        real	1m56.160s
        user	0m55.588s
        sys	0m11.154s
    
    # Run the Denoise
    time nohup bash 06_qiime2_denoise_PE.sh &> 06_qiime2_denoise_PE.out
    
    
    time nohup bash 07_qiime2_tree_PE.sh &> 07_qiime2_tree_PE.out
    time nohup bash 08_qiime2_rarefaction_PE.sh &> 08_qiime2_rarefaction_PE.out
    time nohup bash 09_qiime2_calculate_and_explore_diversity_metrics_PE.sh &> 09_qiime2_calculate_and_explore_diversity_metrics_PE.out
    time nohup bash 10_qiime2_assign_taxonomy_PE.sh &> 10_qiime2_assign_taxonomy_PE.out
    
    
    
