import { Left } from "./left/left.js";
import { Center } from "./center/center.js";
import { Right } from "./right/right.js";


/** @param {Number} m */
const Box = (m) => Widget.CenterBox({
  start_widget: Left(),
  center_widget: Center(),
  end_widget: Right(m),
});


/** @param {Number} m */
export const Bar = (m) => Widget.Window({
  monitor: m,
  name: `bar${m}`,
  anchor: ['top', 'left', 'right'],
  child: Box(m),
  class_name: 'bar',
});
