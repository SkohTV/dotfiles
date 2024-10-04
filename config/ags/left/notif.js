let mute = false;
const label = Variable('')
Utils.exec('dunstctl set-paused false')

const swap = () => {
  mute = !mute
  Utils.exec(`dunstctl set-paused ${mute}`)
  label.value = mute ? '' : '' 
}

export const Notif = Widget.EventBox({
  on_primary_click: swap,
  child: Widget.Label({
    label: label.bind(),
    class_name: 'notif_label'
  })
})
