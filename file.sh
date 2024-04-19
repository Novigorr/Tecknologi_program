#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_directory> <output_directory>"
    exit 1
fi

input_dir=$1
output_dir=$2

mkdir -p $output_dir

files=$(find $input_dir -maxdepth 1 -type f)

for file in $files; do
    filename=$(basename $file)
    cp $file $output_dir/$filename
done

sub_files=$(find $input_dir -mindepth 1 -type f)

for sub_file in $sub_files; do
    filename=$(basename $sub_file)
    cp $sub_file $output_dir/$filename
done

echo "Files copied successfully from $input_dir to $output_dir"
