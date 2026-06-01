import { createState } from "ags";
import { exec } from "ags/process";


// https://github.com/Aylur/ags/blob/main/examples/gtk4/simple-bar/Bar.tsx#L94
    // For eventbox matbe


// Notif button
const start_state = (exec('dunstctl is-paused') === 'true')
const [notif, setNotif] = createState(start_state)
const [labelNotif, setLabelNotif] = createState(start_state ? '' : '')

const toggle_dnd = () => {
    setNotif(!notif.peek())
    exec(`dunstctl set-paused ${notif.peek() ? 'true' : 'false'}`)
    setLabelNotif(notif.peek() ? '' : '')
}



// Wallpaper reroll button
const rr = () => exec(`sh /home/skoh/dev/scripts/reroll_wp.sh`)



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

