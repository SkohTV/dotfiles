#!/usr/bin/env python3

import json
import os
import re
import time
import urllib.request
from dataclasses import dataclass
from datetime import datetime
from zoneinfo import ZoneInfo



with open('.calendar.json.env') as f:
    CALENDARS = json.load(f)

FOLDER = "/tmp/proton-calendar"
os.makedirs(FOLDER, exist_ok=True)

REFETCH_DELAY = 15*60 # 15 min (refetch, recreate list, sort list)
UPDATE_DELAY = 15 # 15 sec (list should be sorted, so really fast)


@dataclass
class Event:
  name: str
  calendar: str
  start: datetime
  end: datetime

events: list[Event] = []
local_tz = datetime.now().astimezone().tzinfo
now = datetime.now(local_tz)


def parse_dt(dt_str, tz):
  '''Manually parse YYYYMMDDTHHMMSS'''
  return datetime(
    year = int(dt_str[0:4]),
    month = int(dt_str[4:6]),
    day = int(dt_str[6:8]),
    hour = int(dt_str[9:11]),
    minute = int(dt_str[11:13]),
    second = int(dt_str[13:15]),
    tzinfo=tz
  )

def format_delta(delta) -> str:
  '''Format a timedelta into a human readable string'''
  total_seconds = int(delta.total_seconds())
  hours, rem = divmod(total_seconds, 3600)
  minutes = rem // 60

  if hours > 0:
    return f"{hours}h {minutes}m"
  return f"{minutes}m"



def fetch_events(cal_name, url, *, download):
  '''Download and parse events from a calendar URL'''
  tmp_file = os.path.join(FOLDER, f"{cal_name}.ics")

  if download:
    print(f"Downloading {cal_name}")
    urllib.request.urlretrieve(url, tmp_file)

  with open(tmp_file, "r") as f:
    content = f.read()

  for event in content.split("BEGIN:VEVENT")[1:]:
    dtstart = re.search(r'DTSTART;TZID=([^:]+):(\d{8}T\d{6})', event)
    dtend = re.search(r'DTEND;TZID=([^:]+):(\d{8}T\d{6})', event)
    summary = re.search(r'SUMMARY:(.+)', event)

    if dtstart and dtend and summary:
      event_tz = ZoneInfo(dtstart.group(1))
      start = parse_dt(dtstart.group(2), event_tz)
      end = parse_dt(dtend.group(2),   event_tz)
      start_local = start.astimezone(local_tz)
      end_local = end.astimezone(local_tz)
      name = summary.group(1).strip()

      events.append(Event(name, cal_name, start_local, end_local))



def fetch_all_calendars():
  global events
  events.clear()

  # Fetch all calendars
  for cal_name, url in CALENDARS.items():
    fetch_events(cal_name, url, download=True)
  events.sort(key = lambda x: x.start)

  events = [e for e in events if now <= e.end]



def update_msg():
  global events

  # Find current and next events across all calendars
  current_events: list[Event] = []
  next_event: list[Event] = []

  closest: None|Event = None

  for e in events:
    if e.start <= now <= e.end:
      current_events.append(e)

    elif e.start > now:
      if closest is None:
        closest = e
      if e.start == closest.start:
        next_event.append(e)

  msg = os.path.join(FOLDER, "msg")
  with open(msg, "w") as f:
    f.write(json.dumps({
      'current': [
        { 'calendar': e.calendar, 'name': e.name, 'for': format_delta(e.end - now)}
        for e in current_events
      ],
      'future': [
        { 'calendar': f.calendar, 'name': f.name, 'in': format_delta(f.start - now)}
        for f in next_event
      ]
    }))



last_fetch = 0
last_update = 0

while True:
    now = datetime.now(local_tz)
    local_tz = datetime.now().astimezone().tzinfo

    if now.timestamp() - last_fetch >= REFETCH_DELAY:
        print("Fetching all calendars")
        fetch_all_calendars()
        last_fetch = now.timestamp()

    if now.timestamp() - last_update >= UPDATE_DELAY:
        print("Updating message")
        update_msg()
        last_update = now.timestamp()

    time.sleep(5)
