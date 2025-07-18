import { createPoll } from "ags/time";

function transform(val: string) {
  if (val.length == 0)
      return '';

  const tmp = JSON.parse(val.toString())
  const SENSOR = 'k10temp-pci-00c3';

  if (tmp[SENSOR] === undefined)
    return 'null';

  const itm = tmp
    [SENSOR]
    ['Tctl']
    ['temp1_input']

  return ` ${itm.toFixed(1)}°C`
}


const temperature = createPoll('', 2000, 'sensors -j')

export default function Temperature() {
    return (<label label={temperature.as(transform)} css_name='temperature_label' />)
}
