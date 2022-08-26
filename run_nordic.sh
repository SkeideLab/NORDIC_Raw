#!/bin/bash -l
#SBATCH -J MATLAB_nordic          # job name
#SBATCH -o /ptmp/<user>/tmp/job.out.%j    # standard out file
#SBATCH -e /ptmp/<user>/tmp/job.err.%j    # standard err file
#SBATCH -D /u/<user>/code/NORDIC_Raw/              # work directory
#SBATCH --ntasks=1         # launch job on a single core
#SBATCH --cpus-per-task=1  #   on a shared node
#SBATCH --mem=20000MB       # memory limit for the job
#SBATCH --time=2:09:59     # run time, up to 24h
module load matlab
srun matlab -nodisplay -nosplash -nodesktop -noFigureWindows -r 'run("apply_nordic.m")'