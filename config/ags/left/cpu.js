/**
 * @param {any} val
 */
function transform(val) {
  const tmp = JSON.parse(val.toString())

  if (tmp['sysstat'] === undefined)
    return 'null';

  const itm = tmp
    ['sysstat']
    ['hosts'][0]
    ['statistics'][0]
    ['cpu-load'][0]

  const usr = Number(itm['usr'] ?? 0)
  const sys = Number(itm['sys'] ?? 0)

  return `   ${(usr + sys).toFixed(2)}%`
}


const cpu = Variable('', {
  poll: [2000, 'mpstat -o JSON'],
});


export const Cpu = Widget.Label({
  label: cpu.bind().as(transform),
  class_name: 'cpu_label',
});
