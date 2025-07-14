let mirror = false;
const label = Variable('')
// Utils.exec('wired --dnd off')

const swap = () => {
  mirror = !mirror

  if (mirror){
    Utils.exec(`hyprctl keyword monitor 'DP-2,highres,auto,1,mirror,$primary_monitor'`)
    Utils.exec(`hyprctl hyprpaper reload eDP-1,/home/skoh/.config/wallpapers/main`)
  } else {
    Utils.exec(`hyprctl reload`)
  }

  label.value = mirror ? '󱞠' : '' 
}

export const Screenshare = () => Widget.EventBox({
  on_primary_click: swap,
  child: Widget.Label({
    label: label.bind(),
    class_name: 'notif_label'
  })
})
