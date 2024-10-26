/**
 * @param {any} self
 * @param {any[]} _
 */
function init(self, ..._) {

  const mode = network.primary

  let icon;
  let name;

  switch (mode) {
  case 'wifi':
    name = network.wifi.ssid;
    icon = icon_switch(network.wifi.strength);    
    break;
  case 'wired':
    name = 'Wired';
    icon = '󱘖'; 
    break;
  case null:
    name = network.wifi.enabled ? 'No Wifi' : 'Wifi Disabled';
    icon = network.wifi.enabled ? '' : '󰤫'; 
    break;
  }

  self.label = `${name} ${icon} `
}

/**
 * @param {number} s
 */
const icon_switch = (s) => {
  if (s > 80) return '󰤨';
  else if (s > 60) return '󰤥';
  else if (s > 40) return '󰤢';
  else if (s > 20) return '󰤟';
  else if (s > 0) return'󰤯';
  else return '󰤮';
}


const network = await Service.import('network')

export const Network = () => Widget.EventBox({
  child: Widget.Label({
    setup: self => self.hook(network, init, 'changed'),
  }),
  on_primary_click: network.toggleWifi,
  class_name: 'network_label'
});
