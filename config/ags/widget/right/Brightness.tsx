import { createState } from "ags"
import { exec } from "ags/process"


const [isNight, setIsNight] = createState(false)
const [bright, setBright] = createState(Math.round(Number(exec('brightnessctl get')) / 255 * 100 ))


// Fetch (+ reset if incorrect) nightmode
switch (exec(`hyprctl hyprsunset temperature`)) {
    case '4000': setIsNight(true); break;
    case '6500': setIsNight(false); break;
    default: setIsNight(false); exec(`hyprctl hyprsunset temperature 6500`)
}


// For slider change
interface changeProps { value: number }
const change = ({ value }: changeProps) => {
    setBright(Math.round(value))
    exec(`brightnessctl set ${bright.get()}%`)
}


// For button click
const swap = () => {
    setIsNight(!isNight.get())

    if (isNight.get())
        exec(`hyprctl hyprsunset temperature 4000`)
    else
        exec(`hyprctl hyprsunset temperature 6500`)
}


export default function Brightness() {
    return (<box css_classes={isNight.as((v) => [v ? 'night' : 'light'])} >
        <button onClicked={swap}>
            <box>
                <label label={isNight.as((v) => v ? '' : '')} />
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
