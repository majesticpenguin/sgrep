function sgrep(){
    i=1;
    grep -rl $1 * | while read line; 

    do echo "$i. $line";
        if [[ -n "$2" ]] && [[ $i -eq $2 ]];
            then vi $line < /dev/tty;
        fi;

        ((i++));
    done
}
export sgrep
