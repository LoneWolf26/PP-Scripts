#!/usr/bin/env bash
mkdir shs
cd shs
k=0
for i in {410000..450000..100}
do
	cp ../run.sh run_$i.sh	
       	sed -i -e 's/IPT1/'$i'/g' run_$i.sh
	k=$(expr $i + 100)
	sed -i -e 's/IPT2/'$k'/g' run_$i.sh
done

