#!/bin/bash

# make output directories
[ ! -d masks/masks ] && mkdir masks masks/masks

# grab inputs from config.json
inputs=($(jq -r '.inputs' config.json  | tr -d '[]," '))

# find all unique files across all inputs
mask_files=(`find ${inputs[*]} -type f -printf '%f\n' | sort -u`)

# loop through mask files
echo "creating average masks"
for (( i=0; i<${#mask_files[*]}; i++ ))
do
    echo ${mask_files[$i]}
    paths=`find ${inputs[*]} -name ${mask_files[0]} | sort -u`
    fslmerge -t ./masks/masks/${mask_files[$i]} ${paths}
    fslmaths ./masks/masks/${mask_files[$i]} -Tmean ./masks/masks/${mask_files[$i]}
done
echo "averaging complete"

if [ -z "$(ls -A masks/masks)" ]; then
    echo "something went wrong. check files and logs"
    exit 1
fi
echo "complete"
exit 0
        