import { Date } from "./date.js";
import { Battery } from "./battery.js";
import { Split_generator } from "../shared/separator.js";


export const Right = Widget.Box({
  hpack: 'end',
  children: [
    Battery,
    Split_generator(),
    Date
  ],
});
