import { createPoll } from "ags/time";

function transform(val: string) {
  const used_line = val.split('\n').find(x => x.includes('used memory')) ?? ''
  const used_val = used_line.trim().split(' ')[0]
  const res = Number(used_val) / 1_000_000;

  return `  ${res.toFixed(2)}GiB`
}


const memory = createPoll('', 2000, 'vmstat -s');

export default function Memory() {
    return (<label label={memory.as(transform)} css_name='memory_label' />)
}
