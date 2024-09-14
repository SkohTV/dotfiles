import { Left } from "./left/left.js";
import { Center } from "./center/center.js";
import { Right } from "./right/right.js";


const scss = `${App.configDir}/shared/style.scss`
const css = `/tmp/ags.css`
Utils.exec(`sassc ${scss} ${css}`)

const box = Widget.CenterBox({
  start_widget: Left,
  center_widget: Center,
  end_widget: Right,
});

const myBar = Widget.Window({
  name: 'bar',
  anchor: ['top', 'left', 'right'],
  child: box,
});

App.config({
  style: css,
  windows: [myBar],
});
