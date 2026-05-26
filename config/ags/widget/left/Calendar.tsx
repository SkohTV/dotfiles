import { createState, For } from "ags"
import { monitorFile, readFile } from "ags/file"


const rf = (f: string) => readFile(f).replace('\n', '')
const [cal, setCal] = createState(rf('/tmp/proton-calendar/msg'))
monitorFile('/tmp/proton-calendar/msg', (f, _) => setCal(rf(f)))


interface FutureEventProps { e: any }
function FutureEvent({ e }: FutureEventProps ){
  console.log(e)
  return (<box>
    <label label={`${e.name} `} css_name='futureevent' css={`color: ${e.color}; font-weight: bold;`} />
    <label label={`in ${e.in}`} css_name='futureevent' css={`color: ${e.color};`} />
  </box>)
}

interface PastEventProps { e: any }
function PastEvent({ e }: PastEventProps ){
  console.log(e)
  if (e === null)
    return (<label label="no event" css_name="noevent" />)

  // return (
  return (<box>
    <label label={`${e.name} `} css_name='pastevent' css={`color: ${e.color}; font-weight: bold;`} />
    <label label={`for ${e.for}`} css_name='pastevent' css={`color: ${e.color};`} />
  </box>)
}

export default function Cava() {
    console.log()
    return (<box>
      <label label="     " />
      <box>
        <For each={cal.as((x) => JSON.parse(x)["current"])}>
          {(v) => <PastEvent e={v} />}
        </For>
      </box>
      <label label=" - " />
      <box>
        <For each={cal.as((x) => JSON.parse(x)["future"])}>
          {(v) => <FutureEvent e={v} />}
        </For>
      </box>
    </box>)
}
