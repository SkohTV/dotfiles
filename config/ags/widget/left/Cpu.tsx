import { createPoll } from "ags/time"

function transform(val: string) {
    if (val.length == 0)
        return '';

    val = (val.split('\n')
        .find(l => l.includes('Cpu(s)')) ?? '')
        .split(/\s+/)[1]
        .replace(',', '.');

    return `   ${val}%`
}


const cpu = createPoll('', 2000, 'top -bn1')

export default function Cpu() {
    return (<label label={cpu.as(transform)} css_name='cpu_label' />) 
}
