#!/usr/bin/env bash

set -e

IPT=39752
source ~abuckley/mc8/env.sh

IODIR=/home/ppe/a/agangan/Run/First_run_continue_2
test -d "$IODIR"

test -n "$TMPDIR" || TMPDIR=/home/ppe/a/agangan/Run/First_run_continue_2/temp/
mkdir -p $TMPDIR && cd $TMPDIR

SLHA=$IODIR/slhaout/out-$IPT.slha
test -s "$SLHA"
cp $SLHA ./prospino.in.les_houches

trap "cp $IPT-prospino-*.dat $IODIR/out/" EXIT

for i in 1 2 3 4
do
    for j in 1 2 3 4 
    do
        if [[ $j -lt $i ]]
	then continue
	fi
        echo $i $j
        prospino.run 1 0 1 13000 0 nn $i $j 0 0
        mv prospino.dat $IPT-prospino-$i$j.dat
        prospino.run 0 0 1 13000 1 nn $i $j 0 0
        mv prospino.dat $IPT-prospino-$i$j-errs.dat
        cp $IPT-prospino-*.dat $IODIR/out/
    done
done

for i in 1 2 3 4
 do
    for  j in 5 6 7 8
    do
        echo $i $j
        prospino.run 1 0 1 13000 0 nn $i $j 0 0
        mv prospino.dat $IPT-prospino-$i$j.dat
        prospino.run 0 0 1 13000 1 nn $i $j 0 0
        mv prospino.dat $IPT-prospino-$i$j-errs.dat
        cp $IPT-prospino-*.dat $IODIR/out/
    done
done

for  i in 5 7; do
    for j in 6 8; do
        echo $i $j
        prospino.run 1 0 1 13000 0 nn $i $j 0 0
        mv prospino.dat $IPT-prospino-$i$j.dat
        prospino.run 0 0 1 13000 1 nn $i $j 0 0
        mv prospino.dat $IPT-prospino-$i$j-errs.dat
        cp $IPT-prospino-*.dat $IODIR/out/
    done
done
