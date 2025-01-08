let mirror = false;
const label = Variable('󰹑')
const cmd_mirror = "hyprctl keyword 'monitor' ',highres,auto,1,mirror,$primary_monitor'";
const cmd_extend = "hyprctl keyword 'monitor' '$secondary_monitor,1920x1080,20000x20000,1' && hyprctl keyword 'monitor' ',highres,auto,1,mirror,$primary_monitor'";

Utils.exec(cmd_extend);

const swap = () => {
  mirror = !mirror
  // Utils.exec(mirror ? cmd_mirror : cmd_extend);
  print(mirror ? cmd_mirror : cmd_extend)
  label.value = mirror ? '󱞟' : '󰹑' 
}

export const Screen = () => Widget.EventBox({
  on_primary_click: swap,
  child: Widget.Label({
    label: label.bind(),
    class_name: 'screen_label'
  })
})
