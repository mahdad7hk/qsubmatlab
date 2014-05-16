index=722

# on a listener node: socat - tcp-listen:1234,fork | tee out.txt    # add nohup

#for er in $(seq $a1 $da $a2)

exp="gheychi"
expAdd="HiResMask/$exp"
#scratchAdd="/scratch/mhossein"
scratchAdd="/Users/mahdad7hk/Documents/temp"
echo $exp
expMain="MediaLab"
expLF=$expMain/"LighFieldLRSP"
resultRoot="$scratchAdd/$expMain/results/$expAdd"
logDir="$resultRoot/logs"

mkdir -p $scratchAdd/$expMain
mkdir -p $resultRoot
mkdir -p $logDir
mkdir -p $scratchAdd/$expLF/$expAdd
mkdir -p $scratchAdd/$expMain/data/$expAdd


mkdir -p ~/matlab
echo "addpath('$scratchAdd/$expLF/$expAdd')" >> ~/matlab/startup.m
# Transfer data
sourcDataAdd="Users/mahdad7hk/Documents/Mahdad/MediaLab/data/$expAdd/"
sourcExpAdd="Users/mahdad7hk/Documents/Mahdad/$expLF/$expAdd/"
sourcScript="Users/mahdad7hk/Documents/Mahdad/MediaLab/LighFieldLRSP_main/"

rsync -r -P mahdad7hk@lts2mac4.epfl.ch:/$sourcDataAdd $scratchAdd/$expMain/data/$expAdd
rsync -r -P mahdad7hk@lts2mac4.epfl.ch:/$sourcExpAdd $scratchAdd/$expLF/$expAdd/
rsync -r -P mahdad7hk@lts2mac4.epfl.ch:/$sourcScript $scratchAdd/$expLF/


for i in `seq $index`
do   
   #echo erasure=$er
  qsub -q short -N "$exp$i" -o "$logDir/$exp$i.txt" -v PARAM1=$i,PARAM2=$scratchAdd/$expLF/$expAdd,PARAM3=$exp LFPatchUnit.pbs

  
done
