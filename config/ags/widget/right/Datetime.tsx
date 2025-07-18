import { createPoll } from "ags/time"
import GLib from "gi://GLib"


const time = createPoll("", 1000, () => {
    return GLib.DateTime.new_now_local().format('%a, %d %b - %H:%M')!
})






export default function Datetime() {
    return <label label={time} css_name='date_label' />
}
