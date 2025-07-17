import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { execAsync } from "ags/process"
import { createPoll } from "ags/time"
import Cpu from "./left/Cpu"
import Temperature from "./left/Temperature"
import Memory from "./left/Memory"
import Distro from "./left/Distro"
import Cava from "./left/Cava"
import Workspaces from "./center/Workspaces"



function Separator() {
    return (<label label="|" css_name="separator" />)
}


export default function Bar(gdkmonitor: Gdk.Monitor) {

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
            </box>
        </centerbox>
    </window>
  )
}
