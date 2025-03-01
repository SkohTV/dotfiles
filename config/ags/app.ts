import { App } from "astal/gtk3"
import style from "./shared/style.scss"
import Bar from "./bar"

App.start({
    css: style,
    main() {
        App.get_monitors().map(Bar)
    },
})
