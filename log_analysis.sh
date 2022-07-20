#! /bin/bash
#bash script to parse and analyze apache access logs
# You need to output two statistics, limited to the top 10 results and sorted numerically by quantity and from highest to lowest value without leading blanks and that lines with greater key values appear earlier in the output instead of later.
# Your script should output both results one after other, and each row must have QUANTITY FILED format, with either space or tabulator as separator.

log_file=$1
declare -A access_dates #=([17/Feb/2020]=5)
declare -A ip_addresses
function access_by_date () {
   while read -r line; do

        date=$(echo "$line" | sed 's/.*\[//g;s/:[0-9].*//g')

        if [ -n access_dates[$date] ]; then
            access_dates[$date]=$((access_dates[$date]+1))
        else
            access_dates+=([$date]=1)
        fi

   done < "$log_file"

   for access_date in ${!access_dates[@]}; do

       echo "${access_dates[$access_date]} $access_date"
       
    done | sort -rn -k1 | head -10
}
function access_by_ip () {
    while read -r line; do
        ip_addr=$(echo $line | awk '{print $1}')
        if [ -n ip_addresses[$ip_addr] ]; then
            ip_addresses[$ip_addr]=$(( ip_addresses[$ip_addr]+1 ))
        else
            ip_addresses+=([$ip_addr]=1)
        fi
    done < "$log_file"
    for ip_address in ${!ip_addresses[@]}; do
        echo "${ip_addresses[$ip_address]} $ip_address"
    done | sort -rn -k1 | head -10
}

access_by_date
echo
access_by_ip