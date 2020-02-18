#!/bin/bash

if [[ $GDIV_ENV != 1 ]] ; then
  module purge
  module load idba/1.1.1_kMSS 
  module load R/3.6.0 
  module load bowtie2/2.3.2
  module load hmmer/3.1b1 
  module load open64/4.5.2
  module load samtools/1.0 
  module load anaconda3/2019.03 &>/dev/null
  if [[ ! -d "$HOME/.conda/envs/genome_diversity" ]] ; then
    GDIV_CONDA=${GDIV_CONDA:-"$HOME/shared3/conda_envs/genome_diversity"}
    mkdir -p "$HOME/.conda/envs"
    ln -s "$GDIV_CONDA" "$HOME/.conda/envs/genome_diversity"
  fi
  source activate genome_diversity
  shared3="$HOME/shared3"
  export PATH="$shared3/apps/enveomics/Scripts:$shared3/bin:$shared3/miga/bin:$PATH"
  export GDIV_ENV=1
fi

