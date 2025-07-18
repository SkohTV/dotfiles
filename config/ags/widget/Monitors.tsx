import Gtk from "gi://Gtk"
import Bar from "./Bar"
import { For, createBinding } from "ags"
import app from "ags/gtk4/app"
import { exec } from "ags/process"
import AstalHyprland from "gi://AstalHyprland?version=0.1"


// Weird hyprland issue
// Fix wallpaper + bar
const hyprland = AstalHyprland.get_default()
hyprland.connect('monitor-removed', () => exec(`hyprctl reload`))


export default function main() {
  const monitors = createBinding(app, "monitors")

  return (
    <For each={monitors} cleanup={(win) => (win as Gtk.Window).destroy()}>
      {(monitor) => <Bar gdkmonitor={monitor} />}
    </For>
  )
}

