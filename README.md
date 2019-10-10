# PP-Scripts

A sequence of scripts that need to be executed before submitting the JOBS.

1) radsamp.py - Python script that generates uniform random data and stores it in pts_out.dat file. Currently does it for 4 parameters M_1, M_2, M_u and tan(beta). Sampling is uniform in log after |10| GeV except for tan(beta). Edit file for sampling range and number of data points.

Usage:-

- python radsamp.py

2) mkslhain.py - Python script used to generate slha input files for SoftSusy. This uses the pts_out.dat file and replaces the tags in in.slha.tmpl to generate a new input file for each data point.

Usage:-

- python mkslhain.py in.slha.tmp pts_out.dat --nmin --nmax --outdir --offset

--nmin - minimum index
--nmax - maxnimum index
--outdir - output directory
--offset - set offset default is 10000 i.e (nmin/nmax+10000)

3) mkslhaout.sh - Bash script to generate slha output files from slha inpit files (uses softsusy.x)

Usage:-

- ./mkslhaout.sh

4) gen_scripts.sh - generates scripts to run prospino jobs for each of the slha out files. These scripts are stored in shs/ folder. Note that before generating one must edit the run.sh file. There the working directories need to be specified. By default slhaout/ contains the slha output files while out/ stores the prospino out files.

Usage:-

- ./gen_scripts.sh

Command to submit jobs:-

- for i in {30000..40000}; do echo $i; qsub -q medium6 ../shs/run_$i.sh; done

run_batch.sh and gen_scripts_batch.sh are used for submitting a batch of runs.
