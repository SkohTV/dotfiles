let mute = false;
const label = Variable('')
Utils.exec('wired --dnd off')

const swap = () => {
  mute = !mute
  Utils.exec(`wired --dnd ${mute ? 'on' : 'off'}`)
  label.value = mute ? '' : '' 
}

export const Notif = () => Widget.EventBox({
  on_primary_click: swap,
  child: Widget.Label({
    label: label.bind(),
    class_name: 'notif_label'
  })
})
