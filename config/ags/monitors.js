import { Bar } from "./bar.js"
import { Popup_win_date } from "./right/date.js";


const hyprland = await Service.import('hyprland')
const windows = [
  {
    bar: null,
    pop_date: null,
  },
  {
    bar: null,
    pop_date: null,
  }
]


/** @param {Number} m */
const add_screen = (m) => {
  windows[m].bar = Bar(m)
  windows[m].pop_date = Popup_win_date(m)

  for (const item in windows[m]){
    App.addWindow(windows[m][item])

    if (item !== 'bar')
      App.closeWindow(windows[m][item].name)
  }
}

/** @param {Number} m */
const remove_screen = (m) => {
  for (const item in windows[m]){
    App.removeWindow(windows[m][item])
    windows[m][item] = null
  }
}


App.connect('config-parsed', (..._) => {
  for (let i = 0; i < hyprland.monitors.length; i++)
    add_screen(i);
})

hyprland.connect('monitor-added', (..._) => add_screen(1))
hyprland.connect('monitor-removed', (..._) => remove_screen(1))
