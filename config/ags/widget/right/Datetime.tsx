import { createState } from "ags"
import { monitorFile, readFile } from "ags/file"
import { Gtk } from "ags/gtk4"
import { createPoll } from "ags/time"
import GLib from "gi://GLib"


const time = createPoll("", 1000, () => {
    return GLib.DateTime.new_now_local().format('%a, %d %b - %H:%M')!
})

const date = createPoll("", 1000, () => {
    return GLib.DateTime.new_now_local().format('%d')
})

const rf = (f: string) => readFile(f).replace('\n', '')

const [icon, setIcon] = createState(rf('/tmp/weather/weather-icon'))
const [temp, setTemp] = createState(rf('/tmp/weather/weather-degree'))
const [txt, setTxt] = createState(rf('/tmp/weather/weather-stat'))
const [color, setColor] = createState(rf('/tmp/weather/weather-hex'))

monitorFile('/tmp/weather/weather-icon', (f, _) => setIcon(rf(f)))
monitorFile('/tmp/weather/weather-degree', (f, _) => setTemp(rf(f)))
monitorFile('/tmp/weather/weather-stat', (f, _) => setTxt(rf(f)))
monitorFile('/tmp/weather/weather-hex', (f, _) => setColor(rf(f)))



export default function Datetime() {
    return (<menubutton>
        <label label={time} css_name='date_label' />
        <popover>
            <box css_name='date_popup' orientation={Gtk.Orientation.VERTICAL}>
                <box css_name='weather_box'>
                    <label
                        css_name='icon'
                        css={color.as((x) => `color: #${x};`)}
                        label={icon}
                    />
                    <box orientation={Gtk.Orientation.VERTICAL}>
                        <label css_name='temp' label={temp} />
                        <label
                            css_name='txt'
                            label={txt}
                            wrap={true}
                            max_width_chars={12}
                            justify={Gtk.Justification.CENTER} 
                        />
                    </box>
                </box>
                <box orientation={Gtk.Orientation.VERTICAL} css_name='cal_box'>
                    <box homogeneous={true} css_name='days'>
                        <label label='Sun' />
                        <label label='Mon' />
                        <label label='Tue' />
                        <label label='Wed' />
                        <label label='Thu' />
                        <label label='Fri' />
                        <label label='Sat' />
                    </box>
                    <Gtk.Calendar
                        show_day_names={false}
                        show_heading={true}
                    />
                </box>
            </box>
        </popover>
    </menubutton>)
}
