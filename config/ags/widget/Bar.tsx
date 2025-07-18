import app from "ags/gtk4/app"
import { Astal, Gdk } from "ags/gtk4"
import Cpu from "./left/Cpu"
import Temperature from "./left/Temperature"
import Memory from "./left/Memory"
import Distro from "./left/Distro"
import Cava from "./left/Cava"
import Workspaces from "./center/Workspaces"
import Battery from "./right/Battery"
import Brightness from "./right/Brightness"
import Sound from "./right/Sound"
import Network from "./right/Network"
import Datetime from "./right/Datetime"



function Separator() {
    return (<label label="|" css_name="separator" />)
}


interface BarProps { gdkmonitor: Gdk.Monitor}
export default function Bar({ gdkmonitor }: BarProps) {

  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  return (
    <window
      visible
      namespace="bar"
      class="Bar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={app}
    >
        <centerbox css_name="centerbox">
            <box $type="start">
                <Distro />
                <Separator />
                <Cpu />
                <Temperature />
                <Memory />
                <Separator />
                <Cava />
            </box>
            <box $type="center">
                <Workspaces />
            </box>
            <box $type="end">
                <Battery />
                <Separator />
                <Brightness />
                <Sound />
                <Separator />
                <Network />
                <Separator />
                <Datetime />
            </box>
        </centerbox>
    </window>
  )
}
