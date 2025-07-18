import { createBinding, createState, For, With } from "ags"
import AstalHyprland from "gi://AstalHyprland"

const hyprland = AstalHyprland.get_default()
const [workspaces, setWorkspaces] = createState(regenerate_all())



// Regenerate all workspace buttons
function regenerate_all(): Array<[number, boolean, boolean, boolean]> {

  const workspaces = hyprland.workspaces;
  const monitors = hyprland.monitors;

  const alive = workspaces.map(x => x.id);
  const displayed = monitors.map(e => e.activeWorkspace.id);
  const focused = hyprland.focused_workspace.id;

  function shorthand(x: number): [number, boolean, boolean, boolean] {
      return [x, alive.includes(x), displayed.includes(x), x === focused]
  }

  return [...Array(10).keys()].map((i) => shorthand(i+1))
}



// Generate TSX for 1 workspace button
interface WorkspaceBtProps { id: number; alive: boolean; displayed: boolean; focused: boolean; }
function WorkspaceBt({ id, alive, displayed, focused }: WorkspaceBtProps){
  const icon = focused ? '󰪥 ' : displayed ? '󰺕 ' : alive ? ' ' : '⚬ ';

    return (
        <button onClicked={() => hyprland.message_async(`dispatch workspace ${id}`)} >
            <label label={icon} css_name={`w${id}`} />
       </button>
    )
}



// Auto regenerate
hyprland.connect('event', () => setWorkspaces(regenerate_all()))


export default function Workspaces() {
    return (<box css_name="workspaces">
        <For each={workspaces}>
            {(v) => <WorkspaceBt id={v[0]} alive={v[1]} displayed={v[2]} focused={v[3] } />}
        </For>
    </box>)
}
