import { Distro } from "./distro.js";
import { Cpu } from "./cpu.js";
import { Temp } from "./temp.js";
import { Memory } from "./memory.js";
import { Cava } from "./cava.js";
import { Split_generator } from "../shared/separator.js";


export const Left = Widget.Box({
  children: [
    Distro,
    Split_generator(),
    Cpu,
    Temp,
    Memory,
    Split_generator(),
    Cava,
  ]
})