import { createBinding, createComputed, With } from 'ags'
import AstalNetwork from 'gi://AstalNetwork'


// Pick an icon for wifi strength
const wifi_icon = (s: number) => {
  if (s > 80) return '󰤨';
  else if (s > 60) return '󰤥';
  else if (s > 40) return '󰤢';
  else if (s > 20) return '󰤟';
  else if (s > 0) return'󰤯';
  else return '󰤮';
}


// Select icon + text for label
const pick_icon_label = ([mode, wifi, ap]: [AstalNetwork.Primary, AstalNetwork.Wifi, AstalNetwork.AccessPoint]) => {
    console.log(mode, wifi, ap)

    switch (mode){

    case AstalNetwork.Primary.WIFI:
        return (ap === null) ?
            '  loading' :
            `${wifi_icon(ap.strength)}  ${ap.ssid}`

    case AstalNetwork.Primary.WIRED:
        return `󱘖  ${ap.ssid}`

    case AstalNetwork.Primary.UNKNOWN:
        return (wifi.enabled) ? `  No WiFi` : `󰤫  No WiFi`

    }
}


export default function Network() {
    const network = AstalNetwork.get_default()

    const mode = createBinding(network, 'primary')
    const wifi = createBinding(network, 'wifi') 

    return (
        <With value={wifi}>
            {(ww) => 
            <label
                label={createComputed([mode, wifi, createBinding(ww, 'active_access_point')]).as(pick_icon_label)}
                css_name='network_label'
                />
            }
        </With>
    )
}
