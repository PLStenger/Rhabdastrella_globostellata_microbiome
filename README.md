# Rhabdastrella_globostellata_microbiome

![graphical_summary_of_primers_map](https://github.com/PLStenger/Rhabdastrella_globostellata_microbiome/blob/main/99_images/primers_map.png)

![graphical_summary_of_sets_of_markers](https://github.com/PLStenger/Rhabdastrella_globostellata_microbiome/blob/main/99_images/set_of_markers.png)


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

For install QIIME2, please refer to http://qiime.org/install/install.html

### Know the number of CPU (threads) of your computer (here for MacOs) :   

    sysctl hw.ncpu
    > hw.ncpu: 4

### Run scripts in local by :


    # Put you in your working directory
    cd /scratch_vol1/fungi/Rhabdastrella_globostellata_microbiome/00_scripts
    
    
    # For run all pipeline, lunch only this command line : 
    time nohup bash 000_run_all_pipeline_in_one_script.sh &> 000_run_all_pipeline_in_one_script.out

    # For run pipeline step by step, lunch :
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
        sys	    0m11.154s
    
    # Run the Denoise
    time nohup bash 06_qiime2_denoise_PE.sh &> 06_qiime2_denoise_PE.out
        real	66m29.579s
        user	129m35.661s
        sys	    4m17.156s
    
    # Run the tree construction
    time nohup bash 07_qiime2_tree_PE.sh &> 07_qiime2_tree_PE.out
        real	8m29.501s
        user	2m23.194s
        sys	0m20.178s
    
    # Run the rarefaction
    time nohup bash 08_qiime2_rarefaction_PE.sh &> 08_qiime2_rarefaction_PE.out
        real	1m15.788s
        user	0m28.194s
        sys	       0m8.118s
        
    # For obtainning better plots, run this script on your computer :    
    08_qiime2_rarefaction_PE_plots.R
    
    time nohup bash 09_qiime2_calculate_and_explore_diversity_metrics_PE.sh &> 09_qiime2_calculate_and_explore_diversity_metrics_PE.out
        real	59m0.552s
        user	7m23.905s
        sys	1m51.603s
    
    time nohup bash 10_qiime2_assign_taxonomy_PE.sh &> 10_qiime2_assign_taxonomy_PE.out
        real	82m44.469s
        user	74m58.003s
        sys	    1m21.506s
    time nohup bash 11_core_biom_PE.sh &> 11_core_biom_PE.out
    
    
    time nohup bash 99_junk.sh &> 99_junk.out


### Results :

<details>
  <summary>Click here for seeing sequence quality plots from FastQC/MultiQC</summary>
  
  <div align="center">
  <img src="https://github.com/PLStenger/Rhabdastrella_globostellata_microbiome/blob/main/99_images/seq_info.png" width="800">
  </div>

 <ins>Figure 1 : Left = raw sequences (results from the script "01_quality_check_by_FastQC.sh") ; right = cleaned sequences (results from the script "03_check_quality_of_cleaned_data.sh")  :</ins>

</details>






<details>
  <summary>Click here for seeing sequence count table</summary>
   
<ins>Table 1 : Results from the script "05_qiime2_import_PE.sh" that give object "demux.qza/.qzv"  :</ins>

| Sample name | Sequence count |
|-------------|----------------|
| BRG2_set_05 | 96250          |
| BRG1_set_05 | 95639          |
| BRG2_set_04 | 92801          |
| BRG1_set_04 | 92791          |
| BRG3_set_04 | 89017          |
| BRG3_set_05 | 87914          |
| BRG2_set_03 | 67233          |
| BRG1_set_03 | 64388          |
| BRG2_set_02 | 63784          |
| BRG1_set_02 | 61540          |
| BRG3_set_02 | 59269          |
| BRG3_set_03 | 58166          |
| BRG1_set_01 | 31251          |
| BRG3_set_01 | 29748          |
| BRG2_set_01 | 29017          |    
    
</details>   
    
    
    
    
    
<details>
  <summary>Click here for per base sequence quality plot from QIIME2</summary>
  
  <div align="center">
  <img src="https://github.com/PLStenger/Rhabdastrella_globostellata_microbiome/blob/main/99_images/quality_base.png" width="800">
  </div>

 <ins>Figure 2 : Quality plots from the "05_qiime2_import_PE.sh" that give object "demux.qza/.qzv".</ins>

</details>






<details>
  <summary>Click here for seeing Denoising stats table</summary>
    
 <ins>Table 2 : Results from the script "06_qiime2_denoise_PE.sh" that give object "SampleData.qza/.qzv"  :</ins>

  
| sample-id   | input | filtered | percentage of input passed filter | denoised | merged | percentage of input merged | non-chimeric | percentage of input non-chimeric |
|-------------|-------|----------|-----------------------------------|----------|--------|----------------------------|--------------|----------------------------------|
| BRG1_set_01 | 31251 | 31251    | 100                               | 30529    | 12401  | 39.68                      | 12171        | 38.95                            |
| BRG1_set_02 | 61540 | 61540    | 100                               | 61076    | 59468  | 96.63                      | 58784        | 95.52                            |
| BRG1_set_03 | 64388 | 63588    | 98.76                             | 62515    | 55436  | 86.1                       | 19184        | 29.79                            |
| BRG1_set_04 | 92791 | 92791    | 100                               | 91602    | 71839  | 77.42                      | 70925        | 76.44                            |
| BRG1_set_05 | 95639 | 94839    | 99.16                             | 93029    | 67772  | 70.86                      | 31334        | 32.76                            |
| BRG2_set_01 | 29017 | 29017    | 100                               | 28386    | 11749  | 40.49                      | 11542        | 39.78                            |
| BRG2_set_02 | 63784 | 63782    | 100                               | 63426    | 60825  | 95.36                      | 60104        | 94.23                            |
| BRG2_set_03 | 67233 | 66209    | 98.48                             | 65146    | 58998  | 87.75                      | 21291        | 31.67                            |
| BRG2_set_04 | 92801 | 92799    | 100                               | 91808    | 72571  | 78.2                       | 71643        | 77.2                             |
| BRG2_set_05 | 96250 | 95226    | 98.94                             | 93528    | 70741  | 73.5                       | 32829        | 34.11                            |
| BRG3_set_01 | 29748 | 29748    | 100                               | 29159    | 12666  | 42.58                      | 12470        | 41.92                            |
| BRG3_set_02 | 59269 | 59268    | 100                               | 58927    | 56975  | 96.13                      | 56380        | 95.13                            |
| BRG3_set_03 | 58166 | 57369    | 98.63                             | 56453    | 518    | 0.89                       | 316          | 0.54                             |
| BRG3_set_04 | 89017 | 89016    | 100                               | 88086    | 69621  | 78.21                      | 68830        | 77.32                            |
| BRG3_set_05 | 87914 | 87117    | 99.09                             | 85615    | 13157  | 14.97                      | 12759        | 14.51                            |

</details>







<details>
  <summary>Click here for seeing number of counts after Denoising</summary>
    
 <ins>Table 3 : Results from the script "06_qiime2_denoise_PE.sh" that give object "Table.qza/.qzv (and compare to nb of sequences before denoise)"  :</ins>


| Sample ID   | Before denoise (demux.qzv) | After denoise (Table.qzv) |
|-------------|----------------------------|---------------------------|
| BRG2_set_04 | 92801                      | 71643                     |
| BRG1_set_04 | 92791                      | 70925                     |
| BRG3_set_04 | 89017                      | 68830                     |
| BRG2_set_02 | 63784                      | 60104                     |
| BRG1_set_02 | 61540                      | 58784                     |
| BRG3_set_02 | 59269                      | 56380                     |
| BRG2_set_05 | 96250                      | 32829                     |
| BRG1_set_05 | 95639                      | 31334                     |
| BRG2_set_03 | 67233                      | 21291                     |
| BRG1_set_03 | 64388                      | 19184                     |
| BRG3_set_05 | 87914                      | 12759                     |
| BRG3_set_01 | 29748                      | 12470                     |
| BRG1_set_01 | 31251                      | 12171                     |
| BRG2_set_01 | 29017                      | 11542                     |
| BRG3_set_03 | 58166                      | 316                       |

</details>



    
<details>
  <summary>Click here for seeing the phylogenetic tree</summary>
  
  <div align="center">
  <img src="https://github.com/PLStenger/Rhabdastrella_globostellata_microbiome/blob/main/99_images/tree.png" width="800">
  </div>

 <ins>Figure 3 : Quality plots from the "05_qiime2_import_PE.sh" that give object "demux.qza/.qzv".</ins>

</details>




<details>
  <summary>Click here for seeing rarefaction plots</summary>
  
  <div align="center">
  <img src="https://github.com/PLStenger/Rhabdastrella_globostellata_microbiome/blob/main/99_images/alpha-rarefaction_shannon.png" width="800">
  </div>
  
  <div align="center">
  <img src="https://github.com/PLStenger/Rhabdastrella_globostellata_microbiome/blob/main/99_images/alpha-rarefaction_faith_pd.png" width="800">
  </div>
  
  <div align="center">
  <img src="https://github.com/PLStenger/Rhabdastrella_globostellata_microbiome/blob/main/99_images/alpha-rarefaction_observed_otu.png" width="800">
  </div>

 <ins>Figure 4 : Rarefaction plots from the "08_qiime2_rarefaction_PE.sh" script and then CSV files graphed by R.</ins>

</details>





<details>
  <summary>Click here for seeing diversity metrics</summary>
  
  <div align="center">
  <img src="https://github.com/PLStenger/Rhabdastrella_globostellata_microbiome/blob/main/99_images/jaccard_emperor_sets.png" width="800">
  </div>
  
  <ins>Sub-Figure : jaccard emperor for sets</ins>
  
  <div align="center">
  <img src="https://github.com/PLStenger/Rhabdastrella_globostellata_microbiome/blob/main/99_images/jaccard_emperor_ind.png" width="800">
  </div>
  
  <ins>Sub-Figure : jaccard emperor for individuals</ins>
  
  
  
  

  <div align="center">
  <img src="https://github.com/PLStenger/Rhabdastrella_globostellata_microbiome/blob/main/99_images/bray_curtis_emperor_sets.png" width="800">
  </div>
  
  <ins>Sub-Figure : Bray Curtis for sets</ins>
  
  <div align="center">
  <img src="https://github.com/PLStenger/Rhabdastrella_globostellata_microbiome/blob/main/99_images/bray_curtis_emperor_ind.png" width="800">
  </div>
  
  <ins>Sub-Figure : Bray Curtis for individuals</ins>
  
  
  
  
  <div align="center">
  <img src="https://github.com/PLStenger/Rhabdastrella_globostellata_microbiome/blob/main/99_images/unweighted_unifrac_emperor_sets.png" width="800">
  </div>
  
  <ins>Sub-Figure : unweighted unifrac for sets</ins>
  
  <div align="center">
  <img src="https://github.com/PLStenger/Rhabdastrella_globostellata_microbiome/blob/main/99_images/unweighted_unifrac_emperor_ind.png" width="800">
  </div>
  
  <ins>Sub-Figure : unweighted unifrac for individuals</ins>
  
  
  
  
  
  <div align="center">
  <img src="https://github.com/PLStenger/Rhabdastrella_globostellata_microbiome/blob/main/99_images/weighted_unifrac_emperor_sets.png" width="800">
  </div>
  
  <ins>Sub-Figure : weighted unifrac for sets</ins>
  
  <div align="center">
  <img src="https://github.com/PLStenger/Rhabdastrella_globostellata_microbiome/blob/main/99_images/weighted_unifrac_emperor_ind.png" width="800">
  </div>
  
  <ins>Sub-Figure : weighted unifrac for individuals</ins>
  
  
  
  
  

 <ins>Figure 5 : Diversity metrics.</ins>

</details>






<details>
  <summary>Click here for seeing barplots</summary>
 
  
  <div align="center">
  <img src="https://github.com/PLStenger/Rhabdastrella_globostellata_microbiome/blob/main/99_images/barplot.png" width="800">
  </div>

 <ins>Figure 6 : Barplot</ins>

</details>


