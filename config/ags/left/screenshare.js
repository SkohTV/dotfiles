const hyprland = await Service.import('hyprland')
const monitors = hyprland.monitors;
const displayed = monitors.map(e => e.activeWorkspace.id);

let mirror = !(displayed.length > 1)
const label = Variable(mirror ? '󱞠' : '')

const swap = () => {
  mirror = !mirror

  if (mirror){
    Utils.exec(`hyprctl keyword monitor 'DP-2,highres,auto,1,mirror,$primary_monitor'`)
    Utils.exec(`hyprctl hyprpaper reload eDP-1,/home/skoh/.config/wallpapers/main`)
  } else {
    Utils.exec(`hyprctl reload`)
  }

  Utils.exec(`pkill ags`)
  label.value = mirror ? '󱞠' : '' 
}

export const Screenshare = () => Widget.EventBox({
  on_primary_click: swap,
  child: Widget.Label({
    label: label.bind(),
    class_name: 'notif_label'
  })
})
