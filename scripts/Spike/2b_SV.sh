#!/bin/bash

# Input vairables are: READ_LENGTH, VAF, MERGED_VCF, MOD_BAM and OUTPUT_DIR
# Optional input variables for short_paragraph mode:
# 1. REFERENCE : reference for MOD_BAM in fasta format
# 2. OUTPUT_PFX : output prefix for paragraph
# READ_LENGTH can be either SHORT or LONG or short_paragraph

READ_LENGTH=$1
VAF=$2
MERGED_VCF=$3
MOD_BAM=$4
OUTPUT_VCF=$5
REFERENCE=$6
OUTPUT_PFX=$7

# Descide which READ_LENGTH was selected
if [ "$READ_LENGTH" = "short" ]; then
    
    bin/idxdepth -b ${MOD_BAM} -r ${REFERENCE} -o ${OUTPUT_PFX}.depth.json
    printf  "id\tpath\tidxdepth\nmxsample\t${MOD_BAM}\t${OUTPUT_PFX}.depth.json\n" > ${OUTPUT_PFX}.sample_manifest.txt
    python3 bin/multigrmpy.py -i  $MERGED_VCF -m   ${OUTPUT_PFX}.sample_manifest.txt  -r $REFERENCE  -o ${OUTPUT_PFX}_out

elif [ "$READ_LENGTH" = "long" ]; then
    echo "Input is 'long' starting Sniffles2"
    # change to conda env which uses python 3.6 called mosaicSim
    conda activate mosaicSim
    sniffles --input $MOD_BAM --genotype-vcf $MERGED_VCF --sample-id mosaicSim --vcf $OUTPUT_VCF
else
    echo "Error: Invalid input"
fi

