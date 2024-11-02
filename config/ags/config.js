import { Left } from "./left/left.js";
import { Center } from "./center/center.js";
import { Right } from "./right/right.js";


const scss = `${App.configDir}/shared/style.scss`
const css = `/tmp/ags.css`
Utils.exec(`sassc ${scss} ${css}`)

const Box = () => Widget.CenterBox({
  start_widget: Left(),
  center_widget: Center(),
  end_widget: Right(),
});


const myBar = (m) => Widget.Window({
  monitor: m,
  name: `bar${m}`,
  anchor: ['top', 'left', 'right'],
  child: Box(),
  class_name: 'bar',
});


const hyprland = await Service.import('hyprland')
const bar_secondary = Variable(null)


App.connect('config-parsed', (..._) => {
  if (hyprland.monitors.length > 1) {
    bar_secondary.value = myBar(1)
    App.addWindow(bar_secondary.value)
  }
})


hyprland.connect('monitor-added', (..._) => {
  bar_secondary.value = myBar(1)
  App.addWindow(bar_secondary.value)
})

hyprland.connect('monitor-removed', (..._) => {
  App.removeWindow(bar_secondary.value)
  bar_secondary.value = null
})


App.config({
  style: css,
  windows: [
    myBar(0)
  ],
});
