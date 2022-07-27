#! /bin/bash
#computing average
#Given  integers, compute their average, rounded to three decimal places.
# Input Format
# The first line contains an integer,
# Each of the following  lines contains a single integer.

# Output Format
# Display the average of the  integers, rounded off to three decimal places.

# declare -a integers
# sum=0
# while read -r line; do
#     integers+=("$line")
# done

# for ((i=1; i < ${#integers[@]}; i++)); do
#     sum=$((sum + integers[i]))
# done

# bc <<< "scale=3; $sum / ${integers[0]}"

read -r n
sum=0;
for((i=0;i<n;i++)); do
    read -r num;
    sum=$((sum+num));
done
bc <<< "scale=3; $sum / $n"