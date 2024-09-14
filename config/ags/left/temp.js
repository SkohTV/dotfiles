/**
 * @param {any} val
 */
function transform(val) {
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


const temp = Variable('', {
  poll: [2000, 'sensors -j'],
});


export const Temp = Widget.Label({
  label: temp.bind().as(transform),
  class_name: 'temp_label',
});
