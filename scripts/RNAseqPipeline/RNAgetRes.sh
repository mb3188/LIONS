#!/bin/sh
# RNAgetRes.sh
# LIONS Variant
# Resources Sets for RNAseq Analysis
# Usage: RNAseqPipeline <1:Resource_set> <2:Resource_Base_dir>
# also called 'species'

# OUTPUT: directories/files for RNAseq Pipeline
# 
	set -e
	#set -o pipefail

# Read Input
	species=$1
	RESOURCES=$2

# Resources Summary
# For each reference genome set the following supporting data are required

	# res : Folder containing exon, exon-boundary, intron information.
		# Reference annotation to be used
		# generated by ????? script

	# chrs : Fasta index file containing chromosome sizes

	# chrfile : Translates UCSC chromosome name to simple name
		# 2 columns; <1: Name> <2:UCSC_name>
			# 13	 chr13
			# X	chrX

	# bwtindex : Folder containing index Files for Bowtie Index
		# [Note implemented]

	# TEdata : Repeat Masker table (RMDB) from UCSC
		# Processed to 7 columns
		# only LINE/SINE/LTR/DNA
		# <chr_name> <start> <end> <strand> <repName> <repClass> <repFamily>

	# chimeric : Repeat Masker table from UCSC; looks same as above


if [ "$species" == "hg19gc_v14" ]; then
# Human Genome 19r GENCODE v14 [MODIFIED]
        res=/home/ababaian/resources/sets/hg19gc_v14/
        chrs=/home/ababaian/resources/chimeric/hg19r.chr.size
        chrfile=/home/ababaian/resources/chimeric/hg19r.bwa.names
        btwindex=/home/ababaian/resources/hg19/bowtie/
	TEdata=/home/ababaian/resources/sets/RM/SINES_LINES_LTRS_hg19
	chimeric=/home/ababaian/resources/sets/RM/ForChimericSearch_hg19

elif [ "$species" == "assembly" ]; then
        res='$pDIR/$name/resources'
        chrs='$RESOURCES/$INDEX/genome/$INDEX.chr.size'
        chrfile='$RESOURCES/$INDEX/genome/$INDEX.bwa.names'
	btwindex='$RESOURCES/$INDEX/genome/'
	TEdata='$RESOURCES/rm/SINES_LINES_LTRS_hg19'
	chimeric='$RESOURCES/rm/ForChimericSearch_hg19'

else
	echo "RNAgetRes.sh ERROR: No matching resources for species: $species" 1>&2
	exit 1
fi

echo $res,$chrs,$chrfile,$TEdata,$chimeric