BATTERY=$(acpi -b | sed -r 's/Battery 0: (.*), (.*)%/{"state": "\1", "value":\2}/g')
STATUS=$(echo "$BATTERY" | jq -r '.state')
CAPACITY=$(echo "$BATTERY" | jq -r '.value')


if [ "$STATUS" == "Charging" ]; then
  if [ "$CAPACITY" -eq 100 ]; then
    ICON='󰂃'
  else
    ICON='󰂄'
  fi

else
  if [ "$CAPACITY" -lt 5 ]; then
    ICON='󰂎'
  elif [ "$CAPACITY" -lt 10 ]; then
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
