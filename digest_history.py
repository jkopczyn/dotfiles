# Lint as: python2
"""Scan through bash_history and store which commands I use

Saves past results in a JSON dict, digested_history.json
"""

#!/usr/bin/env python2.7

import json
import os
import time
from collections import defaultdict

NOW= int(time.time())

TWELVE_HOURS = 12*60*60

ZERO = int

def main():
  command_dict = defaultdict(ZERO)
  homedir = os.path.expanduser('~')
  with open(homedir+"/.bash_history", 'r') as bash_history:
    skip = True
    for line in bash_history:
      if skip:
        skip = False
        continue
      if line[0] == "#":
        try:
          then = int(line[1:])
          if then < NOW - TWELVE_HOURS:
            skip = True
          continue
        except ValueError:
          pass
      cmd = line.partition(" ")[0]
      command_dict[cmd.strip()] += 1
  digested_loc = os.path.join(homedir, "dotfiles", "digested_history.json")
  with open(digested_loc, 'r') as f:
    old_dict = json.load(f)
    for k, v in old_dict.items():
      command_dict[k] += v
  with open(digested_loc, 'w') as f:
    json.dump(command_dict, f, indent=4)


if __name__ == '__main__':
  main()
