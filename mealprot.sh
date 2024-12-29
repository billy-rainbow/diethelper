#!/bin/bash
MealF=/tmp/tf.wt2c
Pgm=`basename $0`
TmpD=/tmp

protf=$TmpF/${Pgm}.out

> $protf
lct=`wc -l $MealF | cut -f1 -d' '`
for item in `index $lct`; do
    set `sed -n "${item}p" $MealF`
    useamt=$1
    refamt=$2
    echo -e "($useamt / $refamt) * \c"
    read protref
    protct=`echo "( $useamt / $refamt ) * $protref" | bc /.bc`
    printf "%.1f\n" `echo "( $useamt / $refamt ) * $protref" | bc /.bc | tee -a $protf`
done
echo `cat $protf | tr '\n' '+' | sed 's/.$//'` | bc /.bc >> $protf
printf "%.1f\n" `tail -1 $protf`

# > /tmp/tf; lc=`wc -l /tmp/tf.wt2c | cut -f1 -d' '`; for item in `index $lc`; do fdata=`sed -n "${item}p" /tmp/tf.wt2c`; set $fdata; echo -e "( $1 / $2 ) * \c"; read pc; echo "( $1 / $2 ) * $pc" | bc /.bc | tee -a /tmp/tf; done
 
