const label = Variable(Math.round(Number(Utils.exec('brightnessctl get')) / 255 * 100 ))
const icon = Variable('')
const is_night = Variable(false)


const change = ({ value }) => {
  label.value = Math.round(value)
  Utils.exec(`brightnessctl set ${label.value}%`)
}

const swap = () => {
  is_night.value = !is_night.value

  if (is_night.value)
    Utils.execAsync(`gammastep -O 3500`)
  else
    Utils.exec(`pkill gammastep`)

  icon.value = is_night.value ? '' : ''
  Bright.child.class_name = is_night.value ? 'night' : 'light'
}


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

export const Bright = Widget.EventBox({
  on_hover: () => Reveal.reveal_child = true,
  on_hover_lost: () => Reveal.reveal_child = false,

  child: Widget.Box({
    class_name: 'light',
    children: [

      Widget.EventBox({

        child: Widget.Box({
          children: [
            Widget.Label({label: icon.bind()}),
            Widget.Label({label: label.bind().transform(x => x.toString().padStart(2, '0'))})
          ]
        }),

        on_primary_click: swap,
      }),

      Reveal
    ]
  })
});
