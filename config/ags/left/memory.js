/**
 * @param {any} val
 */
function transform(val) {
  const used_line = val.split('\n').find(x => x.includes('used memory'))
  const used_val = used_line.trim().split(' ')[0]
  const res = used_val / 1_000_000;

  return `  ${res.toFixed(2)}GiB`
}


const memory = Variable('', {
  poll: [2000, 'vmstat -s'],
});


export const Memory = () => Widget.Label({
  label: memory.bind().as(transform),
  class_name: 'ram_label',
});
