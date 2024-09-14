const cava = Variable('', {
  listen: `${App.configDir}/scripts/cava.sh`,
});


export const Cava = Widget.Label({
  label: cava.bind(),
  class_name: 'cava_label',
});
