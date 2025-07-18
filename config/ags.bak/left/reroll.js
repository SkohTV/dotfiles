const rr = () => {
  Utils.exec(`sh /home/skoh/dev/scripts/reroll_wp.sh`)
  Utils.exec(`pkill ags`)
}


export const Reroll = () => Widget.EventBox({
  on_primary_click: rr,
  child: Widget.Label({
    label: '',
    class_name: 'notif_label'
  })
})
