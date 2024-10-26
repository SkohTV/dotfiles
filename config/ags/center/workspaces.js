// @ts-nocheck

/**
 * @param {any} self
 * @param {any[]} _
 */
function init(self, ..._) {

  const workspaces = hyprland.workspaces;
  const monitors = hyprland.monitors;

  const alive = workspaces.map(x => x.id);
  const displayed = monitors.map(e => e.activeWorkspace.id);
  const focused = hyprland.active;

  const shorthand = (x) => [x, alive.includes(x), displayed.includes(x), x === focused.workspace.id]

  self.children = [
    build_button(...shorthand(1)),
    build_button(...shorthand(2)),
    build_button(...shorthand(3)),
    build_button(...shorthand(4)),
    build_button(...shorthand(5)),
    build_button(...shorthand(6)),
    build_button(...shorthand(7)),
    build_button(...shorthand(8)),
    build_button(...shorthand(9)),
    build_button(...shorthand(10)),
  ];
}


/**
 * @param {any} id
 * @param {any} alive
 * @param {any} focused
 */
function build_button(id, alive, displayed, focused){
  const icon = focused ? '󰪥 ' : displayed ? '󰺕 ' : alive ? ' ' : '⚬ ';

  return Widget.EventBox({
    on_primary_click: () => hyprland.messageAsync(`dispatch workspace ${id}`),
    child: Widget.Label({ label: icon }),
    class_name: `w${id}`,
  })
}


const hyprland = await Service.import('hyprland')


export const Workspaces = () => Widget.Box({
  setup: self => self.hook(hyprland, init, 'changed'),
});
