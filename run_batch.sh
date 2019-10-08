#!/usr/bin/env bash

set +e

IPT=( {IPT1..IPT2} )
source ~abuckley/mc8/env.sh

for t in "${IPT[@]}"
do
	IODIR=/home/ppe/a/agangan/Run/LO_wo_err_run_2/
	test -d "$IODIR"

	test -n "$TMPDIR" || TMPDIR=/home/ppe/a/agangan/Run/LO_wo_err_run_2/temp/
	mkdir -p $TMPDIR && cd $TMPDIR
 
	SLHA=$IODIR/slhaout/out-$t.slha
	test -s "$SLHA"
	cp $SLHA ./prospino.in.les_houches
	
	trap "cp $t-prospino-*.dat $IODIR/out/" EXIT
	
	
	for i in 1 2 3 4
	do
    		for j in 1 2 3 4 
    		do
        		if [[ $j -lt $i ]]
			then continue
			fi
        		echo $i $j
        		prospino.run 0 0 1 13000 0 nn $i $j 0 0
       			mv prospino.dat $t-prospino-$i$j.dat
        		cp $t-prospino-*.dat $IODIR/out/
	
	
    		done
	done
	
	for i in 1 2 3 4
	do
    		for j in 5 6 7 8
    		do
        		echo $i $j
        		prospino.run 0 0 1 13000 0 nn $i $j 0 0
        		mv prospino.dat $t-prospino-$i$j.dat
        		cp $t-prospino-*.dat $IODIR/out/
		done
	done
	
	for i in 5 7
	 do
    		for j in 6 8
		do
        		echo $i $j
        		prospino.run 0 0 1 13000 0 nn $i $j 0 0
        		mv prospino.dat $t-prospino-$i$j.dat
        		cp $t-prospino-*.dat $IODIR/out/
    		done
	done
	echo $t
done
