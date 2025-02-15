function init(self) {

    const MAX_CHARGE = 80;
    const percent = battery.percent;
    const charging = battery.charging;
    const charged = battery.charged;
    const remain = battery.time_remaining;

    const date = new Date(0, 0, 0, 0, 0, remain);
    const hour = date.getHours().toString();
    const min = date.getMinutes().toString().padStart(2, '0');
    const date_str = (hour === '0' ? `${min}min` : `${hour}h${min}`);

    let icon;
    let text;

    if (charged) icon = '󰂃';
    else if (charging) icon = '󰂄';
    else if (percent > 90) icon = '󰁹';
    else if (percent > 80) icon = '󰂂';
    else if (percent > 70) icon = '󰂁';
    else if (percent > 60) icon = '󰂀';
    else if (percent > 50) icon = '󰁿';
    else if (percent > 40) icon = '󰁾';
    else if (percent > 30) icon = '󰁽';
    else if (percent > 20) icon = '󰁼';
    else if (percent > 10) icon = '󰁻';
    else if (percent > 5) icon = '󰁺';
    else icon = '󰂎';

    let low = '';
    if (!charging && percent <= 15) low = 'bat_low';
    if (!charging && percent <= 5) low = 'bat_crit';

    if (percent === MAX_CHARGE && charging) text = 'Fully charged !';
    else if (hour === '0' && min === '00') text = 'Loading...'
    else if (charging) text = `${date_str} until full`;
    else text = `${date_str} remaining`;

    self.label = `${icon} ${percent}%`;
    self.tooltip_text = text;
    self.class_names = [low, 'bat']
}


const battery = await Service.import('battery')

export const Battery = () => Widget.Label({
    setup: self => self.hook(battery, init, 'changed'),
});
