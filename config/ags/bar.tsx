import { App, Astal, Gtk, Gdk } from 'astal/gtk3'
import { Variable } from 'astal'
import Left from './left/_left'
import Center from './center/_center'
import Right from './right/_right'

const time = Variable('').poll(1000, 'date')


export default function Bar(gdkmonitor: Gdk.Monitor) {

    return <window
        className='bar'
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.NORMAL}
        anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT | Astal.WindowAnchor.RIGHT}
        application={App}>

        <centerbox
            startWidget=<Left />
            centerWidget=<Center />
            endWidget=<Right />
        />

    </window>
}
