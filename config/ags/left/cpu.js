/**
 * @param {string} val
 */
function transform(val) {

    if (val.length == 0)
        return ''

    val = val.split('\n')
        .find(l => l.includes('Cpu(s)')) ?? ''

    val = val.split(/\s+/)[1]
        .replace(',', '.')

    return `   ${val}%`
}


const cpu = Variable('', {
    poll: [2000, 'top -bn1'],
});


export const Cpu = () => Widget.Label({
    label: cpu.bind().as(transform),
    class_name: 'cpu_label',
});
