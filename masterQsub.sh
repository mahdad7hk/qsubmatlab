index=200

# on a listener node: socat - tcp-listen:1234,fork | tee out.txt    # add nohup

#for er in $(seq $a1 $da $a2)

exp="gheychi"
echo $exp
#resultRoot="$HOME/Documents/temp/$exp"
resultRoot="$HOME/tmp/mahdad/$exp"
mkdir -p $resultRoot
logDir="$resultRoot/logs"
mkdir -p $logDir

for i in {1..3}
do   
   #echo erasure=$er
   qsub -q short  -N "$exp$i" -o "$logDir/$exp$i.txt" -v PARAM1=$i,PARAM2=$resultRoot LFPatchUnit.pbs
done
