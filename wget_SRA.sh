#!/bin/bash
####################################################################
#
#A (quite) simple submit script for a one or tow processor job
#
####################################################################
#
# SGE options
#
#Change to the current working directory upon starting of the job
#$ -cwd
#
source ~/.bash_profile
# Specify the kind of shell script you use, for example, bash
#$ -S /bin/bash
#
# join the error and standard output streams
#$ -j y
#
#
# don't flood myself with e-mail
#$ -m e
#
# this is my e-mail address
##$ -M zihailing@live.cn
#
#where the format error go
#$ -e /home/hlzi/infor
#where the format output go
#$ -o /home/hlzi/infor
# notify me about pending SIG_STOP and SIG_KILL
#$ -notify
#
# Specify the array start ,end , step
#$ -t 1-6:1 
# end of SGE stuff
#########################################################
# now execute my job:
ARRAY=( head  SRR648274 SRR648275 SRR648276 SRR648286 SRR648287 SRR648288)
# end of job script
DIR=/home/hlzi/project/XY_20171117/raw_data
#wget -r -np -nd -P $DIR ftp://ftp-trace.ncbi.nih.gov/sra/sra-instant/reads/ByRun/sra/SRR/SRR648/${ARRAY[$SGE_TASK_ID]}/${ARRAY[$SGE_TASK_ID]}.sra
