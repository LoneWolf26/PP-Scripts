#! /usr/bin/env bash

source ~abuckley/mc8/env.sh

for i in $*; do
    softpoint.x leshouches < $i > ${i/in/out}
done
