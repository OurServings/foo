#!/bin/bash

# Read items from input and perform calculations
input_file=$1
output_file=$2

echo "" > "$output_file"

while IFS= read -r item; do
  item_cost=$(echo "$item" | jq -r '.item_cost')
  item_lifespan=$(echo "$item" | jq -r '.item_lifespan')
  item_name=$(echo "$item" | jq -r '.item_name')
  
  # Calculate: (item_cost * item_lifespan) / 360
  result=$(echo "scale=2; ($item_cost * $item_lifespan) / 360" | bc)
  
  echo "The result for $item_name: ($item_cost * $item_lifespan) / 360 = $result." >> "$output_file"
done < "$input_file"
