import { createState } from "ags"
import { exec } from "ags/process"


const [isMute, setIsMute] = createState(false)
const [bright, setBright] = createState(Math.round(Number(exec('brightnessctl get')) / 255 * 100 ))


// Fetch (+ reset if incorrect) nightmode
switch (exec(`hyprctl hyprsunset temperature`)) {
    case '4000': setIsMute(true); break;
    case '6500': setIsMute(false); break;
    default: setIsMute(false); exec(`hyprctl hyprsunset temperature 6500`)
}


// For slider change
interface changeProps { value: number }
const change = ({ value }: changeProps) => {
    setBright(Math.round(value))
    exec(`brightnessctl set ${bright.get()}%`)
}


// For button click
const swap = () => {
    setIsMute(!isMute.get())

    if (isMute.get())
        exec(`hyprctl hyprsunset temperature 4000`)
    else
        exec(`hyprctl hyprsunset temperature 6500`)
}


export default function Brightness() {
    return (<box css_classes={isMute.as((v) => [v ? 'night' : 'light'])} >
        <button onClicked={swap}>
            <box>
                <label label={isMute.as((v) => v ? '' : '')} />
                <label label={bright.as((x) => x.toString().padStart(2, '0'))} />
            </box>
        </button>
        <slider
            widthRequest={80}
            value={bright}
            min={0}
            max={99}
            onChangeValue={change}
        />
   </box>)
}
