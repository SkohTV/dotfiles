#!/bin/bash

if [[ $(pidof gammastep) ]]; then
	pkill gammastep
else
  gammastep -O 4000
fi

