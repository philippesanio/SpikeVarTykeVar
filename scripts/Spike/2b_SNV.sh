#!/bin/bash

# Input vairables are: READ_LENGTH, VAF, MERGED_VCF, MOD_BAM and OUTPUT_DIR
# READ_LENGTH can be either SHORT or LONG

READ_LENGTH=$1
VAF=$2
MERGED_VCF=$3
MOD_BAM=$4
OUTPUT_VCF=$5
REFERENCE=$6

if [ "$READ_LENGTH" = "short" ]; then
    # TODO for short reads
    # ./2b_snv_short.sh $READ_LENGTH $VAF $MERGED_VCF $MOD_BAM $OUTPUT_VCF $REFERENCE
    
elif [ "$READ_LENGTH" = "long" ]; then
    # TODO for long reads
    ./2b_snv_long.sh $READ_LENGTH $VAF $MERGED_VCF $MOD_BAM $OUTPUT_VCF $REFERENCE
else
    echo "Error: Invalid read length input! Either short or long is allowed."
fi