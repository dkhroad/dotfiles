export CDRFILES=$HOME/cdr
function cdr {
    if [ $# -eq 0 ]
    then
        for i in $CDRFILES/*
        do
            echo -e `basename $i`\\t\\c
            cat $i
            echo
        done
    else
        if [ "$1" = "+" ]
        then                            # add new path alias
            if [ -z "$2" ]
            then
                    echo "usage: cdr + name"
            else
                    echo -e "$PWD\c" >$CDRFILES/$2
            fi
        elif [ "$1" = "-" ]
        then
            if [ -z "$2" ]
            then
                    echo "usage: cdr - name"
            elif [ -f $CDRFILES/$2 ]
            then
                    rm $CDRFILES/$2
            else
                    echo "no alias for $2"
            fi
        elif [ -n "$1" ]
        then
            if [ -f $CDRFILES/$1 ]
            then
                cd `cat $CDRFILES/$1`
                pwd
            else
                echo "no alias for $1"
            fi
        fi
    fi
}

