/**
 * @param {any} self
 * @param {any[]} _
 */
function init(self, ..._) {

  const percent = battery.percent;
  const charging = battery.charging;
  const charged = battery.charged;
  // const remain = battery.time_remaining;

  let icon = '';

  if (charged) icon = '󰂃';
  else if (charging) icon = '󰂄';
  else if (percent > 90) icon = '󰁹';
  else if (percent > 80) icon = '󰂂';
  else if (percent > 70) icon = '󰂁';
  else if (percent > 60) icon = '󰂀';
  else if (percent > 50) icon = '󰁿';
  else if (percent > 40) icon = '󰁾';
  else if (percent > 30) icon = '󰁽';
  else if (percent > 20) icon = '󰁼';
  else if (percent > 10) icon = '󰁻';
  else if (percent > 5) icon = '󰁺';
  else icon = '󰂎';
  
  self.label = `${icon} ${percent}%`
}


const battery = await Service.import('battery')


export const Battery = Widget.Label({
  setup: self => self.hook(battery, init, 'changed'),
  class_name: 'battery_label'
});
