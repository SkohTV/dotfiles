export const Reroll = () => Widget.EventBox({
  on_primary_click: () => Utils.exec(`sh /home/skoh/dev/scripts/reroll_wp.sh`),
  child: Widget.Label({
    label: '',
    class_name: 'notif_label'
  })
})
