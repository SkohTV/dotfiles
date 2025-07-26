import { execAsync } from "ags/process";
import { createPoll } from "ags/time";
import AstalBattery from "gi://AstalBattery?version=0.1";

const battery = AstalBattery.get_default()
const bat = createPoll(regenerate_all(), 500, regenerate_all)


// Regenerate battery label data
function regenerate_all() {
  const MAX_CHARGE = 80;
  const percent = Math.round(battery.percentage * 100);
  const charging = battery.charging;
  const remain = charging ? battery.time_to_full : battery.time_to_empty;

  const date = new Date(0, 0, 0, 0, 0, remain);
  const hour = date.getHours().toString();
  const min = date.getMinutes().toString().padStart(2, "0");
  const date_str = (hour === "0" ? `${min}min` : `${hour}h${min}`);


  // Icon
  let icon;
  if (charging) icon = "󰂄";
  else if (percent > 90) icon = "󰁹";
  else if (percent > 80) icon = "󰂂";
  else if (percent > 70) icon = "󰂁";
  else if (percent > 60) icon = "󰂀";
  else if (percent > 50) icon = "󰁿";
  else if (percent > 40) icon = "󰁾";
  else if (percent > 30) icon = "󰁽";
  else if (percent > 20) icon = "󰁼";
  else if (percent > 10) icon = "󰁻";
  else if (percent > 5) icon = "󰁺";
  else icon = "󰂎";

  // Low
  let low = "";
  if (!charging && percent <= 15){
    low = "bat_low";
    execAsync(`notify-send --urgency=critical "Low battery" "Battery is ${percent}%"`)
  } 

  // Text
  let text;
  if (percent === MAX_CHARGE && charging) text = "Fully charged !";
  else if (hour === "0" && min === "00") text = "Loading...";
  else if (charging) text = `${date_str} until full`;
  else text = `${date_str} remaining`;

  return {
    label: `${icon} ${percent}% `,
    tooltip_text: text,
    class_names: [low, "battery_label"]
  }
}



export default function Battery() {
  return (<menubutton>
    <label label={bat.as((x) => x.label)} css_classes={bat.as((x) => x.class_names)} />
    <popover>
      <label label={bat.as((x) => x.tooltip_text)} css_name='battery_popup'/>
    </popover>
  </menubutton>)
}
