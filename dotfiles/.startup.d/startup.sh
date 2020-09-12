#!/bin/bash

for f in $(dirname $0)/*.startup.sh; do
	$f
done

