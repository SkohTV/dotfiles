const audio = await Service.import('audio')


const pick_icon = (volume, is_muted) => {
    if (is_muted)
        return '󰝟'
    if (volume > 0.66)
        return '󰕾'
    if (volume > 0.33)
        return '󰖀'
    return '󰕿'
}


const change = ({ value }) => audio.speaker.volume = value / 100;
const swap = () => audio.speaker.is_muted = !audio.speaker.is_muted;


export const Volume = () => {

    // Revealer
    const Reveal = Widget.Revealer({
        revealChild: false,
        transitionDuration: 700,
        transition: 'slide_right',
        child: Widget.Slider({
            min: 0,
            max: 99,
            draw_value: false,
            value: audio.speaker.bind('volume').transform(x => x * 100),
            on_change: change,
        })
    });

    // Widget to return
    const Volume_widget = Widget.EventBox({
        on_hover: () => Reveal.reveal_child = true,
        on_hover_lost: () => Reveal.reveal_child = false,

        child: Widget.Box({
            class_name: audio.speaker.bind('is_muted').transform(
                x => x ? 'mute' : 'sound'
            ),

            children: [

                Widget.EventBox({

                    child: Widget.Box({
                        children: [
                            Widget.Label({
                                label: Utils.merge(
                                    [audio.speaker.bind('volume'), audio.speaker.bind('is_muted')],
                                    pick_icon
                                )
                            }),
                            Widget.Label({
                                label: audio.speaker.bind('volume').transform(
                                    x => (Math.round(x * 100)).toString().padStart(2, '0')
                                )
                            }),
                        ]
                    }),

                    on_primary_click: swap,
                }),

                Reveal
            ]
        })
    });

    // Temporary hover fix
    Volume_widget.connect('leave-notify-event', _ => Reveal.reveal_child = false);
    return Volume_widget
}
