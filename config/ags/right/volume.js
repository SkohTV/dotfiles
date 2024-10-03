const label = Variable(Math.round(Number(Utils.exec(`pamixer --get-volume`))))
const icon = Variable('󰝟')
const is_mute = Variable(Boolean(Utils.exec(`pamixer --get-mute`)))


const pick_icon = () => {
  if (is_mute.value)
    return '󰝟'
  if (label.value > 66)
    return '󰕾'
  if (label.value > 33)
    return '󰖀'
  return '󰕿'
}

const change = ({ value }) => {
  label.value = Math.round(value)
  icon.value = pick_icon()
  Utils.exec(`pamixer --set-volume ${label.value}`)
}

const swap = () => {
  is_mute.value = !is_mute.value

  if (is_mute.value)
    Utils.exec(`pamixer --mute`)
  else
    Utils.exec(`pamixer --unmute`)

  icon.value = pick_icon()
  Volume.class_name = is_mute.value ? 'mute' : 'sound'
}


export const Volume = Widget.Box({
  class_name: 'mute',
  children: [
    Widget.EventBox({
      child: Widget.Label({
        label: icon.bind()
      }),
      on_primary_click: swap
    }),
    Widget.Label({
      label: label.bind().transform(x => x.toString().padStart(2, '0'))
    }),
    Widget.Slider({
      min: 0,
      max: 99,
      value: label.bind(),
      draw_value: false,
      on_change: change,
    })
  ]
});
