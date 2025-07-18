import { createBinding, createComputed } from 'ags'
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
const pick_icon_label = ([mode, wifi]: [AstalNetwork.Primary, AstalNetwork.Wifi]) => {

    switch (mode){

    case AstalNetwork.Primary.WIFI:
        return `${wifi_icon(wifi.strength)}  ${wifi.ssid}`

    case AstalNetwork.Primary.WIRED:
        return `󱘖  Wired`

    case AstalNetwork.Primary.UNKNOWN:
        if (wifi.enabled)
            return `  No WiFi`
        else
            return `󰤫  No WiFi`
    }
}


export default function Network() {
    const network = AstalNetwork.get_default()

    const mode = createBinding(network, 'primary')
    const wifi = createBinding(network, 'wifi') 

    return (
        <button onClicked={() => network.wifi.set_enabled(!network.wifi.enabled)} >
            <label
                label={createComputed([mode, wifi]).as(pick_icon_label)}
                css_name='network_label'
                />
        </button>
    )
}
