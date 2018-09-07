#!/bin/bash




if [ ! $1 ]; then
	echo "usage: $0 logname"
	exit 1
fi


RUN=1


IW1=
IW2=
IW4=
IW8=
IW16=
IW32=
IW64=
IW128=
IW256=
IW512=
IW1024=
IW2048=
IW4096=
IW8192=
IW16384=
IW32768=
IW65536=
IW131072=
IW262144=
IW524288=
IW1048576=

for FILE in ""$1*""; do
	echo $FILE

  	      IW1[$RUN]=`grep "INTEGER & WRITING         1 Kb" $FILE | awk '{print $7}'`
  	      IW2[$RUN]=`grep "INTEGER & WRITING         2 Kb" $FILE | awk '{print $7}'`
  	      IW4[$RUN]=`grep "INTEGER & WRITING         4 Kb" $FILE | awk '{print $7}'`
  	      IW8[$RUN]=`grep "INTEGER & WRITING         8 Kb" $FILE | awk '{print $7}'`
	     IW16[$RUN]=`grep "INTEGER & WRITING        16 Kb" $FILE | awk '{print $7}'`
	     IW32[$RUN]=`grep "INTEGER & WRITING        32 Kb" $FILE | awk '{print $7}'`
	     IW64[$RUN]=`grep "INTEGER & WRITING        64 Kb" $FILE | awk '{print $7}'`
	    IW128[$RUN]=`grep "INTEGER & WRITING       128 Kb" $FILE | awk '{print $7}'`
	    IW256[$RUN]=`grep "INTEGER & WRITING       256 Kb" $FILE | awk '{print $7}'`
	    IW512[$RUN]=`grep "INTEGER & WRITING       512 Kb" $FILE | awk '{print $7}'`
	   IW1024[$RUN]=`grep "INTEGER & WRITING      1024 Kb" $FILE | awk '{print $7}'`
	   IW2048[$RUN]=`grep "INTEGER & WRITING      2048 Kb" $FILE | awk '{print $7}'`
	   IW4096[$RUN]=`grep "INTEGER & WRITING      4096 Kb" $FILE | awk '{print $7}'`
	   IW8192[$RUN]=`grep "INTEGER & WRITING      8192 Kb" $FILE | awk '{print $7}'`
	  IW16384[$RUN]=`grep "INTEGER & WRITING     16384 Kb" $FILE | awk '{print $7}'`
	  IW32768[$RUN]=`grep "INTEGER & WRITING     32768 Kb" $FILE | awk '{print $7}'`
	  IW65536[$RUN]=`grep "INTEGER & WRITING     65536 Kb" $FILE | awk '{print $7}'`
	 IW131072[$RUN]=`grep "INTEGER & WRITING    131072 Kb" $FILE | awk '{print $7}'`
	 IW262144[$RUN]=`grep "INTEGER & WRITING    262144 Kb" $FILE | awk '{print $7}'`
	 IW524288[$RUN]=`grep "INTEGER & WRITING    524288 Kb" $FILE | awk '{print $7}'`
	IW1048576[$RUN]=`grep "INTEGER & WRITING   1048576 Kb" $FILE | awk '{print $7}'`

	RUN=`expr $RUN + 1`

done

echo
echo DEBUG
echo IW1 ${IW1[*]}
echo IW2 ${IW2[*]}
echo IW4 ${IW4[*]}
echo IW8 ${IW8[*]}
echo IW16 ${IW16[*]}
echo IW32 ${IW32[*]}
echo IW64 ${IW64[*]}
echo IW128 ${IW128[*]}
echo IW256 ${IW256[*]}
echo IW512 ${IW512[*]}
echo IW1024 ${IW1024[*]}
echo IW2048 ${IW2048[*]}
echo IW4096 ${IW4096[*]}
echo IW8192 ${IW8192[*]}
echo IW16384 ${IW16384[*]}
echo IW32768 ${IW32768[*]}
echo IW131072 ${IW131072[*]}
echo IW262144 ${IW262144[*]}
echo IW524288 ${IW524288[*]}
echo IW1048576 ${IW1048576[*]}
echo

NUM_MEDIA=1
NUM_DESVIO=1

################################################################################################

SUM=0

for NUM in ${IW1[@]}; do
	SUM=`echo "$SUM + $NUM" | bc`;
done

	MEDIA=`echo "scale = 5 ; $SUM / ( ${#IW1[*]} - 1)"| bc`
	MEDIA_ARRAY[$NUM_MEDIA]=$MEDIA
	NUM_MEDIA=`expr $NUM_MEDIA + 1`
	echo "Média IW1 = $MEDIA"

SUM=0
for NUM in ${IW1[@]}; do
	SUM=`echo "scale = 5; $SUM + ($NUM - $MEDIA)^2" | bc`;
done   

	VARIANCIA=`echo "scale = 5; $SUM /(${#IW1[*]} - 1)" | bc`
	echo "Variância = $VARIANCIA"
	DESVP=`echo "sqrt($VARIANCIA)" | bc`
	echo "Desvio Padrão = $DESVP"
	DESVIO_ARRAY[$NUM_DESVIO]=$DESVP
	NUM_DESVIO=`expr $NUM_DESVIO + 1`
	echo "+1 Desvio Padrão = `echo $MEDIA + $DESVP | bc`"
	echo "-1 Desvio Padrão = `echo $MEDIA - $DESVP | bc`"
	echo "+2 Desvios Padrão = `echo \"$MEDIA + (2 * $DESVP)\" | bc`"
	echo "-2 Desvios Padrão = `echo \"$MEDIA - (2 * $DESVP)\" | bc`"
	echo "+3 Desvios Padrão = `echo \"$MEDIA + (3 * $DESVP)\" | bc`"
	echo "-3 Desvios Padrão = `echo \"$MEDIA - (3 * $DESVP)\" | bc`"

	echo

################################################################################################

SUM=0

for NUM in ${IW2[@]}; do
	SUM=`echo "$SUM + $NUM" | bc`;
done

	MEDIA=`echo "scale = 5 ; $SUM / ( ${#IW2[*]} - 1)"| bc`
	MEDIA_ARRAY[$NUM_MEDIA]=$MEDIA
	NUM_MEDIA=`expr $NUM_MEDIA + 1`
	echo "Média IW2 = $MEDIA"

SUM=0
for NUM in ${IW2[@]}; do
	SUM=`echo "scale = 5; $SUM + ($NUM - $MEDIA)^2" | bc`;
done   

	VARIANCIA=`echo "scale = 5; $SUM /(${#IW2[*]} - 1)" | bc`
	echo "Variância = $VARIANCIA"
	DESVP=`echo "sqrt($VARIANCIA)" | bc`
	echo "Desvio Padrão = $DESVP"
	DESVIO_ARRAY[$NUM_DESVIO]=$DESVP
	NUM_DESVIO=`expr $NUM_DESVIO + 1`
	echo "+1 Desvio Padrão = `echo $MEDIA + $DESVP | bc`"
	echo "-1 Desvio Padrão = `echo $MEDIA - $DESVP | bc`"
	echo "+2 Desvios Padrão = `echo \"$MEDIA + (2 * $DESVP)\" | bc`"
	echo "-2 Desvios Padrão = `echo \"$MEDIA - (2 * $DESVP)\" | bc`"
	echo "+3 Desvios Padrão = `echo \"$MEDIA + (3 * $DESVP)\" | bc`"
	echo "-3 Desvios Padrão = `echo \"$MEDIA - (3 * $DESVP)\" | bc`"

	echo

################################################################################################

SUM=0

for NUM in ${IW4[@]}; do
	SUM=`echo "$SUM + $NUM" | bc`;
done

	MEDIA=`echo "scale = 5 ; $SUM / ( ${#IW4[*]} - 1)"| bc`
	MEDIA_ARRAY[$NUM_MEDIA]=$MEDIA
	NUM_MEDIA=`expr $NUM_MEDIA + 1`
	echo "Média IW4 = $MEDIA"

SUM=0
for NUM in ${IW4[@]}; do
	SUM=`echo "scale = 5; $SUM + ($NUM - $MEDIA)^2" | bc`;
done   

	VARIANCIA=`echo "scale = 5; $SUM /(${#IW4[*]} - 1)" | bc`
	echo "Variância = $VARIANCIA"
	DESVP=`echo "sqrt($VARIANCIA)" | bc`
	echo "Desvio Padrão = $DESVP"
	DESVIO_ARRAY[$NUM_DESVIO]=$DESVP
	NUM_DESVIO=`expr $NUM_DESVIO + 1`
	echo "+1 Desvio Padrão = `echo $MEDIA + $DESVP | bc`"
	echo "-1 Desvio Padrão = `echo $MEDIA - $DESVP | bc`"
	echo "+2 Desvios Padrão = `echo \"$MEDIA + (2 * $DESVP)\" | bc`"
	echo "-2 Desvios Padrão = `echo \"$MEDIA - (2 * $DESVP)\" | bc`"
	echo "+3 Desvios Padrão = `echo \"$MEDIA + (3 * $DESVP)\" | bc`"
	echo "-3 Desvios Padrão = `echo \"$MEDIA - (3 * $DESVP)\" | bc`"

	echo

################################################################################################

SUM=0

for NUM in ${IW8[@]}; do
	SUM=`echo "$SUM + $NUM" | bc`;
done

	MEDIA=`echo "scale = 5 ; $SUM / ( ${#IW8[*]} - 1)"| bc`
	MEDIA_ARRAY[$NUM_MEDIA]=$MEDIA
	NUM_MEDIA=`expr $NUM_MEDIA + 1`
	echo "Média IW8 = $MEDIA"

SUM=0
for NUM in ${IW8[@]}; do
	SUM=`echo "scale = 5; $SUM + ($NUM - $MEDIA)^2" | bc`;
done   

	VARIANCIA=`echo "scale = 5; $SUM /(${#IW8[*]} - 1)" | bc`
	echo "Variância = $VARIANCIA"
	DESVP=`echo "sqrt($VARIANCIA)" | bc`
	echo "Desvio Padrão = $DESVP"
	DESVIO_ARRAY[$NUM_DESVIO]=$DESVP
	NUM_DESVIO=`expr $NUM_DESVIO + 1`
	echo "+1 Desvio Padrão = `echo $MEDIA + $DESVP | bc`"
	echo "-1 Desvio Padrão = `echo $MEDIA - $DESVP | bc`"
	echo "+2 Desvios Padrão = `echo \"$MEDIA + (2 * $DESVP)\" | bc`"
	echo "-2 Desvios Padrão = `echo \"$MEDIA - (2 * $DESVP)\" | bc`"
	echo "+3 Desvios Padrão = `echo \"$MEDIA + (3 * $DESVP)\" | bc`"
	echo "-3 Desvios Padrão = `echo \"$MEDIA - (3 * $DESVP)\" | bc`"

	echo

################################################################################################

SUM=0

for NUM in ${IW16[@]}; do
	SUM=`echo "$SUM + $NUM" | bc`;
done

	MEDIA=`echo "scale = 5 ; $SUM / ( ${#IW16[*]} - 1)"| bc`
	MEDIA_ARRAY[$NUM_MEDIA]=$MEDIA
	NUM_MEDIA=`expr $NUM_MEDIA + 1`
	echo "Média IW16 = $MEDIA"

SUM=0
for NUM in ${IW16[@]}; do
	SUM=`echo "scale = 5; $SUM + ($NUM - $MEDIA)^2" | bc`;
done   

	VARIANCIA=`echo "scale = 5; $SUM /(${#IW16[*]} - 1)" | bc`
	echo "Variância = $VARIANCIA"
	DESVP=`echo "sqrt($VARIANCIA)" | bc`
	echo "Desvio Padrão = $DESVP"
	DESVIO_ARRAY[$NUM_DESVIO]=$DESVP
	NUM_DESVIO=`expr $NUM_DESVIO + 1`
	echo "+1 Desvio Padrão = `echo $MEDIA + $DESVP | bc`"
	echo "-1 Desvio Padrão = `echo $MEDIA - $DESVP | bc`"
	echo "+2 Desvios Padrão = `echo \"$MEDIA + (2 * $DESVP)\" | bc`"
	echo "-2 Desvios Padrão = `echo \"$MEDIA - (2 * $DESVP)\" | bc`"
	echo "+3 Desvios Padrão = `echo \"$MEDIA + (3 * $DESVP)\" | bc`"
	echo "-3 Desvios Padrão = `echo \"$MEDIA - (3 * $DESVP)\" | bc`"

	echo

################################################################################################

SUM=0

for NUM in ${IW32[@]}; do
	SUM=`echo "$SUM + $NUM" | bc`;
done

	MEDIA=`echo "scale = 5 ; $SUM / ( ${#IW32[*]} - 1)"| bc`
	MEDIA_ARRAY[$NUM_MEDIA]=$MEDIA
	NUM_MEDIA=`expr $NUM_MEDIA + 1`
	echo "Média IW32 = $MEDIA"

SUM=0
for NUM in ${IW32[@]}; do
	SUM=`echo "scale = 5; $SUM + ($NUM - $MEDIA)^2" | bc`;
done   

	VARIANCIA=`echo "scale = 5; $SUM /(${#IW32[*]} - 1)" | bc`
	echo "Variância = $VARIANCIA"
	DESVP=`echo "sqrt($VARIANCIA)" | bc`
	echo "Desvio Padrão = $DESVP"
	DESVIO_ARRAY[$NUM_DESVIO]=$DESVP
	NUM_DESVIO=`expr $NUM_DESVIO + 1`
	echo "+1 Desvio Padrão = `echo $MEDIA + $DESVP | bc`"
	echo "-1 Desvio Padrão = `echo $MEDIA - $DESVP | bc`"
	echo "+2 Desvios Padrão = `echo \"$MEDIA + (2 * $DESVP)\" | bc`"
	echo "-2 Desvios Padrão = `echo \"$MEDIA - (2 * $DESVP)\" | bc`"
	echo "+3 Desvios Padrão = `echo \"$MEDIA + (3 * $DESVP)\" | bc`"
	echo "-3 Desvios Padrão = `echo \"$MEDIA - (3 * $DESVP)\" | bc`"

	echo

################################################################################################

SUM=0

for NUM in ${IW64[@]}; do
	SUM=`echo "$SUM + $NUM" | bc`;
done

	MEDIA=`echo "scale = 5 ; $SUM / ( ${#IW64[*]} - 1)"| bc`
	MEDIA_ARRAY[$NUM_MEDIA]=$MEDIA
	NUM_MEDIA=`expr $NUM_MEDIA + 1`
	echo "Média IW64 = $MEDIA"

SUM=0
for NUM in ${IW64[@]}; do
	SUM=`echo "scale = 5; $SUM + ($NUM - $MEDIA)^2" | bc`;
done   

	VARIANCIA=`echo "scale = 5; $SUM /(${#IW64[*]} - 1)" | bc`
	echo "Variância = $VARIANCIA"
	DESVP=`echo "sqrt($VARIANCIA)" | bc`
	echo "Desvio Padrão = $DESVP"
	DESVIO_ARRAY[$NUM_DESVIO]=$DESVP
	NUM_DESVIO=`expr $NUM_DESVIO + 1`
	echo "+1 Desvio Padrão = `echo $MEDIA + $DESVP | bc`"
	echo "-1 Desvio Padrão = `echo $MEDIA - $DESVP | bc`"
	echo "+2 Desvios Padrão = `echo \"$MEDIA + (2 * $DESVP)\" | bc`"
	echo "-2 Desvios Padrão = `echo \"$MEDIA - (2 * $DESVP)\" | bc`"
	echo "+3 Desvios Padrão = `echo \"$MEDIA + (3 * $DESVP)\" | bc`"
	echo "-3 Desvios Padrão = `echo \"$MEDIA - (3 * $DESVP)\" | bc`"

	echo

################################################################################################

SUM=0

for NUM in ${IW128[@]}; do
	SUM=`echo "$SUM + $NUM" | bc`;
done

	MEDIA=`echo "scale = 5 ; $SUM / ( ${#IW128[*]} - 1)"| bc`
	MEDIA_ARRAY[$NUM_MEDIA]=$MEDIA
	NUM_MEDIA=`expr $NUM_MEDIA + 1`
	echo "Média IW128 = $MEDIA"

SUM=0
for NUM in ${IW128[@]}; do
	SUM=`echo "scale = 5; $SUM + ($NUM - $MEDIA)^2" | bc`;
done   

	VARIANCIA=`echo "scale = 5; $SUM /(${#IW128[*]} - 1)" | bc`
	echo "Variância = $VARIANCIA"
	DESVP=`echo "sqrt($VARIANCIA)" | bc`
	echo "Desvio Padrão = $DESVP"
	DESVIO_ARRAY[$NUM_DESVIO]=$DESVP
	NUM_DESVIO=`expr $NUM_DESVIO + 1`
	echo "+1 Desvio Padrão = `echo $MEDIA + $DESVP | bc`"
	echo "-1 Desvio Padrão = `echo $MEDIA - $DESVP | bc`"
	echo "+2 Desvios Padrão = `echo \"$MEDIA + (2 * $DESVP)\" | bc`"
	echo "-2 Desvios Padrão = `echo \"$MEDIA - (2 * $DESVP)\" | bc`"
	echo "+3 Desvios Padrão = `echo \"$MEDIA + (3 * $DESVP)\" | bc`"
	echo "-3 Desvios Padrão = `echo \"$MEDIA - (3 * $DESVP)\" | bc`"

	echo

################################################################################################

SUM=0

for NUM in ${IW256[@]}; do
	SUM=`echo "$SUM + $NUM" | bc`;
done

	MEDIA=`echo "scale = 5 ; $SUM / ( ${#IW256[*]} - 1)"| bc`
	MEDIA_ARRAY[$NUM_MEDIA]=$MEDIA
	NUM_MEDIA=`expr $NUM_MEDIA + 1`
	echo "Média IW256 = $MEDIA"

SUM=0
for NUM in ${IW256[@]}; do
	SUM=`echo "scale = 5; $SUM + ($NUM - $MEDIA)^2" | bc`;
done   

	VARIANCIA=`echo "scale = 5; $SUM /(${#IW256[*]} - 1)" | bc`
	echo "Variância = $VARIANCIA"
	DESVP=`echo "sqrt($VARIANCIA)" | bc`
	echo "Desvio Padrão = $DESVP"
	DESVIO_ARRAY[$NUM_DESVIO]=$DESVP
	NUM_DESVIO=`expr $NUM_DESVIO + 1`
	echo "+1 Desvio Padrão = `echo $MEDIA + $DESVP | bc`"
	echo "-1 Desvio Padrão = `echo $MEDIA - $DESVP | bc`"
	echo "+2 Desvios Padrão = `echo \"$MEDIA + (2 * $DESVP)\" | bc`"
	echo "-2 Desvios Padrão = `echo \"$MEDIA - (2 * $DESVP)\" | bc`"
	echo "+3 Desvios Padrão = `echo \"$MEDIA + (3 * $DESVP)\" | bc`"
	echo "-3 Desvios Padrão = `echo \"$MEDIA - (3 * $DESVP)\" | bc`"

	echo

################################################################################################

SUM=0

for NUM in ${IW512[@]}; do
	SUM=`echo "$SUM + $NUM" | bc`;
done

	MEDIA=`echo "scale = 5 ; $SUM / ( ${#IW512[*]} - 1)"| bc`
	MEDIA_ARRAY[$NUM_MEDIA]=$MEDIA
	NUM_MEDIA=`expr $NUM_MEDIA + 1`
	echo "Média IW512 = $MEDIA"

SUM=0
for NUM in ${IW512[@]}; do
	SUM=`echo "scale = 5; $SUM + ($NUM - $MEDIA)^2" | bc`;
done   

	VARIANCIA=`echo "scale = 5; $SUM /(${#IW512[*]} - 1)" | bc`
	echo "Variância = $VARIANCIA"
	DESVP=`echo "sqrt($VARIANCIA)" | bc`
	echo "Desvio Padrão = $DESVP"
	DESVIO_ARRAY[$NUM_DESVIO]=$DESVP
	NUM_DESVIO=`expr $NUM_DESVIO + 1`
	echo "+1 Desvio Padrão = `echo $MEDIA + $DESVP | bc`"
	echo "-1 Desvio Padrão = `echo $MEDIA - $DESVP | bc`"
	echo "+2 Desvios Padrão = `echo \"$MEDIA + (2 * $DESVP)\" | bc`"
	echo "-2 Desvios Padrão = `echo \"$MEDIA - (2 * $DESVP)\" | bc`"
	echo "+3 Desvios Padrão = `echo \"$MEDIA + (3 * $DESVP)\" | bc`"
	echo "-3 Desvios Padrão = `echo \"$MEDIA - (3 * $DESVP)\" | bc`"

	echo

################################################################################################

SUM=0

for NUM in ${IW1024[@]}; do
	SUM=`echo "$SUM + $NUM" | bc`;
done

	MEDIA=`echo "scale = 5 ; $SUM / ( ${#IW1024[*]} - 1)"| bc`
	MEDIA_ARRAY[$NUM_MEDIA]=$MEDIA
	NUM_MEDIA=`expr $NUM_MEDIA + 1`
	echo "Média IW1024 = $MEDIA"

SUM=0
for NUM in ${IW1024[@]}; do
	SUM=`echo "scale = 5; $SUM + ($NUM - $MEDIA)^2" | bc`;
done   

	VARIANCIA=`echo "scale = 5; $SUM /(${#IW1024[*]} - 1)" | bc`
	echo "Variância = $VARIANCIA"
	DESVP=`echo "sqrt($VARIANCIA)" | bc`
	echo "Desvio Padrão = $DESVP"
	DESVIO_ARRAY[$NUM_DESVIO]=$DESVP
	NUM_DESVIO=`expr $NUM_DESVIO + 1`
	echo "+1 Desvio Padrão = `echo $MEDIA + $DESVP | bc`"
	echo "-1 Desvio Padrão = `echo $MEDIA - $DESVP | bc`"
	echo "+2 Desvios Padrão = `echo \"$MEDIA + (2 * $DESVP)\" | bc`"
	echo "-2 Desvios Padrão = `echo \"$MEDIA - (2 * $DESVP)\" | bc`"
	echo "+3 Desvios Padrão = `echo \"$MEDIA + (3 * $DESVP)\" | bc`"
	echo "-3 Desvios Padrão = `echo \"$MEDIA - (3 * $DESVP)\" | bc`"

	echo

################################################################################################

SUM=0

for NUM in ${IW2048[@]}; do
	SUM=`echo "$SUM + $NUM" | bc`;
done

	MEDIA=`echo "scale = 5 ; $SUM / ( ${#IW2048[*]} - 1)"| bc`
	MEDIA_ARRAY[$NUM_MEDIA]=$MEDIA
	NUM_MEDIA=`expr $NUM_MEDIA + 1`
	echo "Média IW2048 = $MEDIA"

SUM=0
for NUM in ${IW2048[@]}; do
	SUM=`echo "scale = 5; $SUM + ($NUM - $MEDIA)^2" | bc`;
done   

	VARIANCIA=`echo "scale = 5; $SUM /(${#IW2048[*]} - 1)" | bc`
	echo "Variância = $VARIANCIA"
	DESVP=`echo "sqrt($VARIANCIA)" | bc`
	echo "Desvio Padrão = $DESVP"
	DESVIO_ARRAY[$NUM_DESVIO]=$DESVP
	NUM_DESVIO=`expr $NUM_DESVIO + 1`
	echo "+1 Desvio Padrão = `echo $MEDIA + $DESVP | bc`"
	echo "-1 Desvio Padrão = `echo $MEDIA - $DESVP | bc`"
	echo "+2 Desvios Padrão = `echo \"$MEDIA + (2 * $DESVP)\" | bc`"
	echo "-2 Desvios Padrão = `echo \"$MEDIA - (2 * $DESVP)\" | bc`"
	echo "+3 Desvios Padrão = `echo \"$MEDIA + (3 * $DESVP)\" | bc`"
	echo "-3 Desvios Padrão = `echo \"$MEDIA - (3 * $DESVP)\" | bc`"

	echo

################################################################################################

SUM=0

for NUM in ${IW4096[@]}; do
	SUM=`echo "$SUM + $NUM" | bc`;
done

	MEDIA=`echo "scale = 5 ; $SUM / ( ${#IW4096[*]} - 1)"| bc`
	MEDIA_ARRAY[$NUM_MEDIA]=$MEDIA
	NUM_MEDIA=`expr $NUM_MEDIA + 1`
	echo "Média IW4096 = $MEDIA"

SUM=0
for NUM in ${IW4096[@]}; do
	SUM=`echo "scale = 5; $SUM + ($NUM - $MEDIA)^2" | bc`;
done   

	VARIANCIA=`echo "scale = 5; $SUM /(${#IW4096[*]} - 1)" | bc`
	echo "Variância = $VARIANCIA"
	DESVP=`echo "sqrt($VARIANCIA)" | bc`
	echo "Desvio Padrão = $DESVP"
	DESVIO_ARRAY[$NUM_DESVIO]=$DESVP
	NUM_DESVIO=`expr $NUM_DESVIO + 1`
	echo "+1 Desvio Padrão = `echo $MEDIA + $DESVP | bc`"
	echo "-1 Desvio Padrão = `echo $MEDIA - $DESVP | bc`"
	echo "+2 Desvios Padrão = `echo \"$MEDIA + (2 * $DESVP)\" | bc`"
	echo "-2 Desvios Padrão = `echo \"$MEDIA - (2 * $DESVP)\" | bc`"
	echo "+3 Desvios Padrão = `echo \"$MEDIA + (3 * $DESVP)\" | bc`"
	echo "-3 Desvios Padrão = `echo \"$MEDIA - (3 * $DESVP)\" | bc`"

	echo

################################################################################################

SUM=0

for NUM in ${IW8192[@]}; do
	SUM=`echo "$SUM + $NUM" | bc`;
done

	MEDIA=`echo "scale = 5 ; $SUM / ( ${#IW8192[*]} - 1)"| bc`
	MEDIA_ARRAY[$NUM_MEDIA]=$MEDIA
	NUM_MEDIA=`expr $NUM_MEDIA + 1`
	echo "Média IW8192 = $MEDIA"

SUM=0
for NUM in ${IW8192[@]}; do
	SUM=`echo "scale = 5; $SUM + ($NUM - $MEDIA)^2" | bc`;
done   

	VARIANCIA=`echo "scale = 5; $SUM /(${#IW8192[*]} - 1)" | bc`
	echo "Variância = $VARIANCIA"
	DESVP=`echo "sqrt($VARIANCIA)" | bc`
	echo "Desvio Padrão = $DESVP"
	DESVIO_ARRAY[$NUM_DESVIO]=$DESVP
	NUM_DESVIO=`expr $NUM_DESVIO + 1`
	echo "+1 Desvio Padrão = `echo $MEDIA + $DESVP | bc`"
	echo "-1 Desvio Padrão = `echo $MEDIA - $DESVP | bc`"
	echo "+2 Desvios Padrão = `echo \"$MEDIA + (2 * $DESVP)\" | bc`"
	echo "-2 Desvios Padrão = `echo \"$MEDIA - (2 * $DESVP)\" | bc`"
	echo "+3 Desvios Padrão = `echo \"$MEDIA + (3 * $DESVP)\" | bc`"
	echo "-3 Desvios Padrão = `echo \"$MEDIA - (3 * $DESVP)\" | bc`"

	echo

################################################################################################

SUM=0

for NUM in ${IW16384[@]}; do
	SUM=`echo "$SUM + $NUM" | bc`;
done

	MEDIA=`echo "scale = 5 ; $SUM / ( ${#IW16384[*]} - 1)"| bc`
	MEDIA_ARRAY[$NUM_MEDIA]=$MEDIA
	NUM_MEDIA=`expr $NUM_MEDIA + 1`
	echo "Média IW16384 = $MEDIA"

SUM=0
for NUM in ${IW16384[@]}; do
	SUM=`echo "scale = 5; $SUM + ($NUM - $MEDIA)^2" | bc`;
done   

	VARIANCIA=`echo "scale = 5; $SUM /(${#IW16384[*]} - 1)" | bc`
	echo "Variância = $VARIANCIA"
	DESVP=`echo "sqrt($VARIANCIA)" | bc`
	echo "Desvio Padrão = $DESVP"
	DESVIO_ARRAY[$NUM_DESVIO]=$DESVP
	NUM_DESVIO=`expr $NUM_DESVIO + 1`
	echo "+1 Desvio Padrão = `echo $MEDIA + $DESVP | bc`"
	echo "-1 Desvio Padrão = `echo $MEDIA - $DESVP | bc`"
	echo "+2 Desvios Padrão = `echo \"$MEDIA + (2 * $DESVP)\" | bc`"
	echo "-2 Desvios Padrão = `echo \"$MEDIA - (2 * $DESVP)\" | bc`"
	echo "+3 Desvios Padrão = `echo \"$MEDIA + (3 * $DESVP)\" | bc`"
	echo "-3 Desvios Padrão = `echo \"$MEDIA - (3 * $DESVP)\" | bc`"

	echo

################################################################################################

SUM=0

for NUM in ${IW32768[@]}; do
	SUM=`echo "$SUM + $NUM" | bc`;
done

	MEDIA=`echo "scale = 5 ; $SUM / ( ${#IW32768[*]} - 1)"| bc`
	MEDIA_ARRAY[$NUM_MEDIA]=$MEDIA
	NUM_MEDIA=`expr $NUM_MEDIA + 1`
	echo "Média IW32768 = $MEDIA"

SUM=0
for NUM in ${IW32768[@]}; do
	SUM=`echo "scale = 5; $SUM + ($NUM - $MEDIA)^2" | bc`;
done   

	VARIANCIA=`echo "scale = 5; $SUM /(${#IW32768[*]} - 1)" | bc`
	echo "Variância = $VARIANCIA"
	DESVP=`echo "sqrt($VARIANCIA)" | bc`
	echo "Desvio Padrão = $DESVP"
	DESVIO_ARRAY[$NUM_DESVIO]=$DESVP
	NUM_DESVIO=`expr $NUM_DESVIO + 1`
	echo "+1 Desvio Padrão = `echo $MEDIA + $DESVP | bc`"
	echo "-1 Desvio Padrão = `echo $MEDIA - $DESVP | bc`"
	echo "+2 Desvios Padrão = `echo \"$MEDIA + (2 * $DESVP)\" | bc`"
	echo "-2 Desvios Padrão = `echo \"$MEDIA - (2 * $DESVP)\" | bc`"
	echo "+3 Desvios Padrão = `echo \"$MEDIA + (3 * $DESVP)\" | bc`"
	echo "-3 Desvios Padrão = `echo \"$MEDIA - (3 * $DESVP)\" | bc`"

	echo

################################################################################################

SUM=0

for NUM in ${IW65536[@]}; do
	SUM=`echo "$SUM + $NUM" | bc`;
done

	MEDIA=`echo "scale = 5 ; $SUM / ( ${#IW65536[*]} - 1)"| bc`
	MEDIA_ARRAY[$NUM_MEDIA]=$MEDIA
	NUM_MEDIA=`expr $NUM_MEDIA + 1`
	echo "Média IW65536 = $MEDIA"

SUM=0
for NUM in ${IW65536[@]}; do
	SUM=`echo "scale = 5; $SUM + ($NUM - $MEDIA)^2" | bc`;
done   

	VARIANCIA=`echo "scale = 5; $SUM /(${#IW65536[*]} - 1)" | bc`
	echo "Variância = $VARIANCIA"
	DESVP=`echo "sqrt($VARIANCIA)" | bc`
	echo "Desvio Padrão = $DESVP"
	DESVIO_ARRAY[$NUM_DESVIO]=$DESVP
	NUM_DESVIO=`expr $NUM_DESVIO + 1`
	echo "+1 Desvio Padrão = `echo $MEDIA + $DESVP | bc`"
	echo "-1 Desvio Padrão = `echo $MEDIA - $DESVP | bc`"
	echo "+2 Desvios Padrão = `echo \"$MEDIA + (2 * $DESVP)\" | bc`"
	echo "-2 Desvios Padrão = `echo \"$MEDIA - (2 * $DESVP)\" | bc`"
	echo "+3 Desvios Padrão = `echo \"$MEDIA + (3 * $DESVP)\" | bc`"
	echo "-3 Desvios Padrão = `echo \"$MEDIA - (3 * $DESVP)\" | bc`"

	echo

################################################################################################

SUM=0

for NUM in ${IW131072[@]}; do
	SUM=`echo "$SUM + $NUM" | bc`;
done

	MEDIA=`echo "scale = 5 ; $SUM / ( ${#IW131072[*]} - 1)"| bc`
	MEDIA_ARRAY[$NUM_MEDIA]=$MEDIA
	NUM_MEDIA=`expr $NUM_MEDIA + 1`
	echo "Média IW131072 = $MEDIA"

SUM=0
for NUM in ${IW131072[@]}; do
	SUM=`echo "scale = 5; $SUM + ($NUM - $MEDIA)^2" | bc`;
done   

	VARIANCIA=`echo "scale = 5; $SUM /(${#IW131072[*]} - 1)" | bc`
	echo "Variância = $VARIANCIA"
	DESVP=`echo "sqrt($VARIANCIA)" | bc`
	echo "Desvio Padrão = $DESVP"
	DESVIO_ARRAY[$NUM_DESVIO]=$DESVP
	NUM_DESVIO=`expr $NUM_DESVIO + 1`
	echo "+1 Desvio Padrão = `echo $MEDIA + $DESVP | bc`"
	echo "-1 Desvio Padrão = `echo $MEDIA - $DESVP | bc`"
	echo "+2 Desvios Padrão = `echo \"$MEDIA + (2 * $DESVP)\" | bc`"
	echo "-2 Desvios Padrão = `echo \"$MEDIA - (2 * $DESVP)\" | bc`"
	echo "+3 Desvios Padrão = `echo \"$MEDIA + (3 * $DESVP)\" | bc`"
	echo "-3 Desvios Padrão = `echo \"$MEDIA - (3 * $DESVP)\" | bc`"

	echo

################################################################################################

SUM=0

for NUM in ${IW262144[@]}; do
	SUM=`echo "$SUM + $NUM" | bc`;
done

	MEDIA=`echo "scale = 5 ; $SUM / ( ${#IW262144[*]} - 1)"| bc`
	MEDIA_ARRAY[$NUM_MEDIA]=$MEDIA
	NUM_MEDIA=`expr $NUM_MEDIA + 1`
	echo "Média IW262144 = $MEDIA"

SUM=0
for NUM in ${IW262144[@]}; do
	SUM=`echo "scale = 5; $SUM + ($NUM - $MEDIA)^2" | bc`;
done   

	VARIANCIA=`echo "scale = 5; $SUM /(${#IW262144[*]} - 1)" | bc`
	echo "Variância = $VARIANCIA"
	DESVP=`echo "sqrt($VARIANCIA)" | bc`
	echo "Desvio Padrão = $DESVP"
	DESVIO_ARRAY[$NUM_DESVIO]=$DESVP
	NUM_DESVIO=`expr $NUM_DESVIO + 1`
	echo "+1 Desvio Padrão = `echo $MEDIA + $DESVP | bc`"
	echo "-1 Desvio Padrão = `echo $MEDIA - $DESVP | bc`"
	echo "+2 Desvios Padrão = `echo \"$MEDIA + (2 * $DESVP)\" | bc`"
	echo "-2 Desvios Padrão = `echo \"$MEDIA - (2 * $DESVP)\" | bc`"
	echo "+3 Desvios Padrão = `echo \"$MEDIA + (3 * $DESVP)\" | bc`"
	echo "-3 Desvios Padrão = `echo \"$MEDIA - (3 * $DESVP)\" | bc`"

	echo

################################################################################################

SUM=0

for NUM in ${IW524288[@]}; do
	SUM=`echo "$SUM + $NUM" | bc`;
done

	MEDIA=`echo "scale = 5 ; $SUM / ( ${#IW524288[*]} - 1)"| bc`
	MEDIA_ARRAY[$NUM_MEDIA]=$MEDIA
	NUM_MEDIA=`expr $NUM_MEDIA + 1`
	echo "Média IW524288 = $MEDIA"

SUM=0
for NUM in ${IW524288[@]}; do
	SUM=`echo "scale = 5; $SUM + ($NUM - $MEDIA)^2" | bc`;
done   

	VARIANCIA=`echo "scale = 5; $SUM /(${#IW524288[*]} - 1)" | bc`
	echo "Variância = $VARIANCIA"
	DESVP=`echo "sqrt($VARIANCIA)" | bc`
	echo "Desvio Padrão = $DESVP"
	DESVIO_ARRAY[$NUM_DESVIO]=$DESVP
	NUM_DESVIO=`expr $NUM_DESVIO + 1`
	echo "+1 Desvio Padrão = `echo $MEDIA + $DESVP | bc`"
	echo "-1 Desvio Padrão = `echo $MEDIA - $DESVP | bc`"
	echo "+2 Desvios Padrão = `echo \"$MEDIA + (2 * $DESVP)\" | bc`"
	echo "-2 Desvios Padrão = `echo \"$MEDIA - (2 * $DESVP)\" | bc`"
	echo "+3 Desvios Padrão = `echo \"$MEDIA + (3 * $DESVP)\" | bc`"
	echo "-3 Desvios Padrão = `echo \"$MEDIA - (3 * $DESVP)\" | bc`"

	echo

################################################################################################

SUM=0

for NUM in ${IW1048576[@]}; do
	SUM=`echo "$SUM + $NUM" | bc`;
done

	MEDIA=`echo "scale = 5 ; $SUM / ( ${#IW1048576[*]} - 1)"| bc`
	MEDIA_ARRAY[$NUM_MEDIA]=$MEDIA
	NUM_MEDIA=`expr $NUM_MEDIA + 1`
	echo "Média IW1048576 = $MEDIA"

SUM=0
for NUM in ${IW1048576[@]}; do
	SUM=`echo "scale = 5; $SUM + ($NUM - $MEDIA)^2" | bc`;
done   

	VARIANCIA=`echo "scale = 5; $SUM /(${#IW1048576[*]} - 1)" | bc`
	echo "Variância = $VARIANCIA"
	DESVP=`echo "sqrt($VARIANCIA)" | bc`
	echo "Desvio Padrão = $DESVP"
	DESVIO_ARRAY[$NUM_DESVIO]=$DESVP
	NUM_DESVIO=`expr $NUM_DESVIO + 1`
	echo "+1 Desvio Padrão = `echo $MEDIA + $DESVP | bc`"
	echo "-1 Desvio Padrão = `echo $MEDIA - $DESVP | bc`"
	echo "+2 Desvios Padrão = `echo \"$MEDIA + (2 * $DESVP)\" | bc`"
	echo "-2 Desvios Padrão = `echo \"$MEDIA - (2 * $DESVP)\" | bc`"
	echo "+3 Desvios Padrão = `echo \"$MEDIA + (3 * $DESVP)\" | bc`"
	echo "-3 Desvios Padrão = `echo \"$MEDIA - (3 * $DESVP)\" | bc`"

	echo

################################################################################################
echo "Média:"
for NUM in ${MEDIA_ARRAY[@]}; do
	echo -n "$NUM, "
done

echo -e "\n\nDesvio padrão:"
for NUM in ${DESVIO_ARRAY[@]}; do
	echo -n "$NUM, "
done
