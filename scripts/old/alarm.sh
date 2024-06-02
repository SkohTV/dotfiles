
# (60*60) * 3 + (60) * 40 = 3h40
# lp=$((60 * 1))

lp=$1
sound=$2

while (( lp > 0 )); do
  hour=$(( $lp / 3600 ))
  min=$(( ($lp - $hour*3600) / 60 ))
  sec=$(( ($lp - $hour*3600 - min*60) % 60))
  echo "${hour}h${min}m${sec}s"
  sleep 1
  lp=$[$lp-1]
done



vlc "$sound" --loop
