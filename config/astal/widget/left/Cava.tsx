import { createSubprocess } from "ags/process";


const cava = createSubprocess('', './widget/cava.sh')

export default function Cava() {
    return (<label label={cava} css_name='cava_label' />)
}
