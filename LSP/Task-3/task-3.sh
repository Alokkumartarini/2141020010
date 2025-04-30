#!/bin/bash

# Declare variables
name="Alice"
age=20

# If-else statement based on the integer value
if [ $age -ge 18 ]; then
    echo "$name is an adult."
else
    echo "$name is a minor."
fi
