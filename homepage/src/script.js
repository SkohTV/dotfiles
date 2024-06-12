const SMALL = document.getElementById("clock-small");
const LARGE = document.getElementById("clock-large");

function realtimeClock() {
  let clock = new Date();

  let day = clock.toLocaleString("en", { weekday: "long" });
  let month = clock.toLocaleString("en", { month: "long" });
  let date = clock.getDate();
  let hrs = clock.getHours();
  let mins = clock.getMinutes();

  hrs = ("0" + hrs).slice(-2);
  mins = ("0" + mins).slice(-2);

  SMALL.innerHTML = `${day}, ${month} ${date}`;
  LARGE.innerHTML = `${hrs}:${mins}`;
}

setInterval(realtimeClock, 500);
setInterval(realtimeClock, 500);