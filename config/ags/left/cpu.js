/**
 * @param {any} val
 */
function transform(val) {

  return `   na%`
}


const cpu = Variable('', {
  poll: [2000, 'mpstat -o JSON'],
});


export const Cpu = () => Widget.Label({
  label: cpu.bind().as(transform),
  class_name: 'cpu_label',
});
