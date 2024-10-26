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

App.config({
  style: css,
  windows: [
    myBar(0),
    myBar(1)
  ],
});
