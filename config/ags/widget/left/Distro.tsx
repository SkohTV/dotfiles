import { createBinding, createState } from "ags";
import { exec } from "ags/process";
import app from "ags/gtk4/app";
import AstalHyprland from "gi://AstalHyprland?version=0.1";


// https://github.com/Aylur/ags/blob/main/examples/gtk4/simple-bar/Bar.tsx#L94
    // For eventbox matbe


// Notif button
const [notif, setNotif] = createState(false)
const [labelNotif, setLabelNotif] = createState('')

const toggle_dnd = () => {
    setNotif(!notif.get())
    exec(`wired --dnd ${notif.get() ? 'on' : 'off'}`)
    setLabelNotif(notif.get() ? '' : '')
}



// Wallpaper reroll button
const rr = () => exec(`sh /home/skoh/dev/scripts/reroll_wp.sh`)



// Screenshare button
const [screenshare, setScreenshare] = createState(!(app.get_monitors().length > 1))
const [labelScreenshare, setLabelScreenshare] = createState(screenshare.get() ? '󱞠' : '')

const toggle_screenshare = () => {
    setScreenshare(!screenshare.get())

  if (screenshare.get()){
    exec(`hyprctl keyword monitor 'DP-2,highres,auto,1,mirror,$primary_monitor'`)
    exec(`hyprctl hyprpaper reload eDP-1,/home/skoh/.config/wallpapers/main`)
  } else {
    exec(`hyprctl reload`)
  }

  setLabelScreenshare(pick_icon(screenshare.get()))
}

const pick_icon = (b: boolean) => b ? '󱞠' : ''



// Distro image
export default function Distro() {

    return (<box>
        <image
            file={`./widget/imgs/nixos.png`}
            pixel_size={16}
            css_name='distro_label'
        />
        <box>
            <button onClicked={toggle_dnd}>
                <label label={labelNotif} css_name="notif_label" />
            </button>
            <button onClicked={rr}>
                <label label='' css_name="wallpaper_label" />
            </button>
        </box>
    </box>)

}


            // <button onClicked={toggle_screenshare}>
            //     <label label={labelScreenshare} css_name="screenshare_label" />
            // </button>
