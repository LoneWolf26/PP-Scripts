#!/usr/bin/env bash
mkdir shs
cd shs
for i in {30001..40000}
do
cp ../run.sh run_$i.sh
sed -i -e 's/@IPT@/'$i'/g' run_$i.sh
done
