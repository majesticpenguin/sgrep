function sgrep(){
    options=$1
    searchterm=$2
    searchpath=($@)

    unset searchpath[0]
    unset searchpath[1]

    if [[ ${#searchterm} -le 0 ]]; then
        echo "Invalid search term!"
        return 1
    fi;

    files=($(grep $options $searchterm ${searchpath[*]}))

    for i in "${!files[@]}"
    do
        count=$((i + 1))
        echo $count". "${files[$i]}
    done

    #delay function for line item input
    read -p "Open file : " filenumber
    #subtract 1 from vifile to reset to 0
    truefilenumber=$((filenumber - 1))
    #get file from array
    file=${files[$truefilenumber]}
    #open file
    vi $file < /dev/tty;
}
export sgrep
