const date = Variable('', {
  poll: [1000, `date +'%a, %m/%d - %I:%M %p'`],
})


export const Date = () => Widget.Label({
  label: date.bind(),
  class_name: 'date_label',
})
