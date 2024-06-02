

BATTERY=$(eww get EWW_BATTERY)
STATUS=$(echo "$BATTERY" | jq -r '.BAT1.status')
CAPACITY=$(echo "$BATTERY" | jq -r '.BAT1.capacity')


if [ "$STATUS" == "Charging" ]; then
  if [ "$CAPACITY" -eq 100 ]; then
    ICON='󰂃'
  else
    ICON='󰂄'
  fi
else
  if [ "$CAPACITY" -lt 10 ]; then
    ICON='󰁺'
  elif [ "$CAPACITY" -lt 20 ]; then
    ICON='󰁻'
  elif [ "$CAPACITY" -lt 30 ]; then
    ICON='󰁼'
  elif [ "$CAPACITY" -lt 40 ]; then
    ICON='󰁽'
  elif [ "$CAPACITY" -lt 50 ]; then
    ICON='󰁾'
  elif [ "$CAPACITY" -lt 60 ]; then
    ICON='󰁿'
  elif [ "$CAPACITY" -lt 70 ]; then
    ICON='󰂀'
  elif [ "$CAPACITY" -lt 80 ]; then
    ICON='󰂁'
  elif [ "$CAPACITY" -lt 90 ]; then
    ICON='󰂂'
  else
    ICON='󰁹'
  fi
fi

echo "${ICON} ${CAPACITY}%"
