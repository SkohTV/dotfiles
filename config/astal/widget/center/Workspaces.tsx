import { For } from "ags"
import Hyprland from "gi://AstalHyprland"

// function init(self, ..._) {
//
//
//   self.children = [
//     build_button(...shorthand(1)),
//     build_button(...shorthand(2)),
//     build_button(...shorthand(3)),
//     build_button(...shorthand(4)),
//     build_button(...shorthand(5)),
//     build_button(...shorthand(6)),
//     build_button(...shorthand(7)),
//     build_button(...shorthand(8)),
//     build_button(...shorthand(9)),
//     build_button(...shorthand(10)),
//   ];
// }
//
//
// /**
//  * @param {any} id
//  * @param {any} alive
//  * @param {any} focused
//  */
// function build_button(id, alive, displayed, focused){
//
//   return Widget.EventBox({
//     on_primary_click: () => hyprland.messageAsync(`dispatch workspace ${id}`),
//     child: Widget.Label({ label: icon }),
//     class_name: `w${id}`,
//   })
// }
//
//
// const hyprland = await Service.import('hyprland')
//
//
// export const Workspaces = () => Widget.Box({
//   setup: self => self.hook(hyprland, init, 'changed'),
// });

function WorkspaceButton({ id, alive, displayed, focused }) {
    const icon = focused ? '󰪥 ' : displayed ? '󰺕 ' : alive ? ' ' : '⚬ ';

    return (
        <button onClicked={hyprland.messageAsync(`dispatch workspace ${id}`)} >
            <label label={icon} css_name={`w${id}`} />
       </button>
    )
}


const hyprland = Hyprland.get_default()


export default function Workspaces() {

    const workspaces = new Hyprland.Workspace()

    // const workspaces = hyprland.workspaces;
    // const monitors = hyprland.monitors;
    //
    // const alive = workspaces.map(x => x.id);
    // const displayed = monitors.map(e => e.activeWorkspace.id);
    // const focused = hyprland.focusedWorkspace.id;
    //
    // const numbers = [...Array(10).keys()].map((i) => i+1);
            // {(v) => <WorkspaceButton id={v} alive={alive.includes(v)} displayed={displayed.includes(v)} focused={v === focused}/>}

    return (<box>
        <For each={workspaces}>
            {(v) => <box></box>}
        </For>
    </box>)
}
