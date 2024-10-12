#!/bin/bash

# Read parameters from params.json
calculations=$(jq -c '.parameters' params.json)
echo "$calculations"
