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
}



export const Volume = () => {

  // Revealer
  const Reveal = Widget.Revealer({
    revealChild: false,
    transitionDuration: 700,
    transition: 'slide_right',
    child: Widget.Slider({
      min: 0,
      max: 99,
      value: label.bind(),
      draw_value: false,
      on_change: change,
    })
  });

  // Widget to return
  const Volume_widget = Widget.EventBox({
    on_hover: () => Reveal.reveal_child = true,
    on_hover_lost: () => Reveal.reveal_child = false,

    child: Widget.Box({
      class_name: is_mute.bind().transform(x => x ? 'mute' : 'sound'),
      children: [

        Widget.EventBox({

          child: Widget.Box({
            children: [
              Widget.Label({ label: icon.bind()}),
              Widget.Label({label: label.bind().transform(x => x.toString().padStart(2, '0'))}),
            ]
          }),

          on_primary_click: swap,
        }),

        Reveal
      ]
    })
  });

  return Volume_widget
}
