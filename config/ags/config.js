import { } from "./monitors.js"

const scss = `${App.configDir}/shared/style.scss`
const css = `/tmp/ags.css`
Utils.exec(`sassc ${scss} ${css}`)

App.config({
  style: css,
});
