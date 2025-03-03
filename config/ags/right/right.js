import { CurrentTime } from "./date.js";
import { Network } from "./network.js";
import { Battery } from "./battery.js";
import { Split_generator } from "../shared/separator.js";
import { Bright } from "./brightness.js";
import { Volume } from "./volume.js";


/** @param {Number} m */
export const Right = (m) => Widget.Box({
  hpack: 'end',
  children: [
    Battery(),
    Split_generator(),
    Bright(),
    Volume(),
    Split_generator(),
    Network(),
    Split_generator(),
    CurrentTime(m)
  ],
});
