#!/bin/bash

cd programs/

for file in *.sh; do
	./$file
done

