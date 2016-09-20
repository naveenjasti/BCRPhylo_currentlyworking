#! /bin/env bash

# this assumes scripts live in a dir "GH" and data in a dir "data"

# parse Tas data to phylip file
python GH/TasParse.py data/Tas/150228_Clone_3-8.fasta > data/Tas/150228_Clone_3-8.phylip

# run phylip's dna parsimony program and rename its outputs
dnapars <<- 	STDIN > /dev/null
		/fh/fast/matsen_e/wdewitt/gctree/data/Tas/150228_Clone_3-8.phylip
		J
		13
		10
		Y

		STDIN
mv outfile data/Tas/150228_Clone_3-8.dnapars.outfile
mv outtree data/Tas/150228_Clone_3-8.dnapars.outtree

# branching process likelihoods of parsimony results
python GH/recurse.py data/Tas/150228_Clone_3-8.dnapars.outtree