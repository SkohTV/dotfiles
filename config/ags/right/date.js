const date = Variable('', {
  poll: [1000, `date +'%a, %m/%d - %I:%M %p'`],
})

const flex_cal = Variable(gen_cal())

function gen_cal() {
  return Widget.Calendar({
    showDayNames: false,
    showDetails: true,
    showHeading: true,

    expand: true,
    hpack: 'fill',
    vpack: 'fill',
  })
}


const p_calendar = () => Widget.Box({
  vertical: true,
  class_name: 'cal_box',
  children: [

    Widget.Box({
      homogeneous: true,
      class_name: 'days',
      children: [
        Widget.Label({ label: 'Sun' }),
        Widget.Label({ label: 'Mon' }),
        Widget.Label({ label: 'Tue' }),
        Widget.Label({ label: 'Wed' }),
        Widget.Label({ label: 'Thu' }),
        Widget.Label({ label: 'Fri' }),
        Widget.Label({ label: 'Sat' })
      ]
    }),

    flex_cal.value
  ]
})

const p_weather = () => Widget.Box({
  class_name: 'weather_box',
  children: [

    Widget.Label({
      class_name: 'icon',
      label: icon.bind()
    }),

    Widget.Box({
      vertical: true,
      children: [

        Widget.Label({
          class_name: 'temp',
          label: temp.bind()
        }),
        Widget.Label({
          class_name: 'txt',
          label: txt.bind()
        })

      ]
    })

  ]
})

const popup = () => Widget.Box({
  vertical: true,
  homogeneous: false,
  children: [
    p_weather(),
    p_calendar()
  ]
})


/** @param {Number} m */
export const Popup_win_date = (m) => Widget.Window({
  monitor: m,
  name: `date_popup${m}`,
  anchor: ['top', 'right'],
  child: popup(),
  class_name: 'date_popup',
  margins: [18+10, 10, 0, 0]
})


const icon = Variable(Utils.readFile('/tmp/weather/weather-icon').replace('\n', ''))
const temp = Variable(Utils.readFile('/tmp/weather/weather-degree').replace('\n', ''))
const txt = Variable(Utils.readFile('/tmp/weather/weather-stat').replace('\n', ''))
const color = Variable(Utils.readFile('/tmp/weather/weather-hex').replace('\n', ''))

Utils.monitorFile('/tmp/weather/weather-icon', (f, _) => icon.value = Utils.readFile(f).replace('\n', ''))
Utils.monitorFile('/tmp/weather/weather-degree', (f, _) => temp.value = Utils.readFile(f).replace('\n', ''))
Utils.monitorFile('/tmp/weather/weather-stat', (f, _) => txt.value = Utils.readFile(f).replace('\n', ''))
Utils.monitorFile('/tmp/weather/weather-hex', (f, _) => color.value = Utils.readFile(f).replace('\n', ''))


/** @param {Number} m */
function up_date(m){
  // const cal_item = flex_cal.value.date
  // const cal_date = [cal_item[0], cal_item[1]+1, cal_item[2]].join('-')
  // const true_date = Utils.exec("date +'%Y-%m-%d'")
  //
  // print(cal_date, true_date)
  // if (cal_date !== true_date){
  //   console.log('re-generating calendar item')
  //   flex_cal.value = gen_cal();
  // }
}


/** @param {Number} m */
export const CurrentTime = (m) => {

  const ret = Widget.EventBox({
    on_hover: () => { up_date(m) ; App.openWindow(`date_popup${m}`) },
    on_hover_lost: () => { },

    child: Widget.Label({
      label: date.bind(),
      class_name: 'date_label',
    })
  })

  ret.connect('leave-notify-event', _ => App.closeWindow(`date_popup${m}`) ) 

  return ret
}
