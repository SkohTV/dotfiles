import Hyprland from "gi://AstalHyprland"



const hyprland = Hyprland.get_default()

for (const client of hyprland.get_clients()) {
    print(client.title)
}

function build_button(id: number, alive: boolean, displayed: boolean, focused: boolean){
  const icon = focused ? '󰪥 ' : displayed ? '󰺕 ' : alive ? ' ' : '⚬ ';

    return <button
    
    />
}


  //return Widget.EventBox({
  //  on_primary_click: () => hyprland.messageAsync(`dispatch workspace ${id}`),
  //  child: Widget.Label({ label: icon }),
  //  class_name: `w${id}`,
  //})


export default function Workspaces() {
    return <label
        label="hello"
    />
}
