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
// AccessPoint[] is required for reload
const pick_icon_label = ([mode, wifi, _]: [AstalNetwork.Primary, AstalNetwork.Wifi, AstalNetwork.AccessPoint[]]) => {

    switch (mode){

    case AstalNetwork.Primary.WIFI:
        return `${wifi_icon(wifi.active_access_point.strength)}  ${wifi.active_access_point.ssid}`

    case AstalNetwork.Primary.WIRED:
        return `󱘖  Wired`

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
                label={createComputed([mode, wifi, createBinding(ww, 'accessPoints')]).as(pick_icon_label)}
                css_name='network_label'
                />
            }
        </With>
    )
}
