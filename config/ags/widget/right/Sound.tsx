import { createBinding, createComputed, createState } from "ags"
import { exec } from "ags/process"
import AstalWp from "gi://AstalWp"

// @ts-ignore
const wp: AstalWp.wp = AstalWp.get_default()
const default_speaker = wp.audio.default_speaker;


// Select icon from volume + muted
const pick_icon = ([v, mt]: [number, boolean]) => {
    return (mt ? '󰝟' : (v > 66) ? '󰕾' : (v > 33) ? '󰖀' : '󰕿')
}


// For button click
const swap = () => {
    default_speaker.set_mute(!default_speaker.mute)
}


export default function Sound() {
    const volume = createBinding(default_speaker, 'volume').as((x) => Math.round(x * 100))
    const mute = createBinding(default_speaker, 'mute')

    return (<box css_classes={mute.as((v) => [v ? 'mute' : 'sound'])} >
        <button onClicked={swap}>
            <box>
                <label label={createComputed([volume, mute]).as(pick_icon)} />
                <label label={volume.as((x) => x.toString().padStart(2, '0'))} />
            </box>
        </button>
        <slider
            widthRequest={80}
            value={volume}
            min={0}
            max={99}
            onChangeValue={({ value }) => default_speaker.set_volume(value / 100)}
        />
   </box>)
}
