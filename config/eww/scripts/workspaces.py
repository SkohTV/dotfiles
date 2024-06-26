#!/usr/bin/env python

import json

from time import sleep
import subprocess



LEFT_B = '\u007b'
RIGHT_B = '\u007d'
TIMEOUT = 0.05


def run(args: list[str]) -> bytes:
  '''Run a shell command'''
  return subprocess.check_output(args)

def decode(stdin: bytes) -> dict|list:
  '''Convert command input into json'''
  return json.loads(stdin.decode('utf-8'))



while True:

  # Run commands
  active_workspace = decode(run(['hyprctl', 'activeworkspace', '-j']))
  all_workspaces = decode(run(['hyprctl', 'workspaces', '-j']))

  # Check types (for lsp happiness)
  if (not isinstance(active_workspace, dict) or not isinstance(all_workspaces, list)):
    exit()

  # Format response
  workspace_alive = [itm['id'] for itm in all_workspaces]
  workspace_bool = [idx in workspace_alive for idx in range(1, 11)]
  workspace_bool_json = json.dumps(workspace_bool)
  active_workspace_id = active_workspace['id']

  # Output and wait
  print(f'{LEFT_B}"active":{active_workspace_id}, "all":{workspace_bool_json}{RIGHT_B}', flush=True)
  sleep(TIMEOUT)

