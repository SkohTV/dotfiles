import app from "ags/gtk4/app"
import style from "./style.scss"
import Bar from "./widget/Bar"

app.start({
  css: style,
  main() {
    Bar(app.get_monitors()[0])
  },
})






// function refresh_monitors() {
//     console.log(app.get_monitors())
// }
//
//
// const hyprland = Hyprland.get_default()
//
// hyprland.connect('monitor-added', () => setTimeout(refresh_monitors, 3000))
// hyprland.connect('monitor-removed', () => setTimeout(refresh_monitors, 3000))
