#!/bin/bash

if [ -z "$TYPE" ]; then
  cd examples/simple
  ./wishful_simple_agent --config ./agent_config.yaml &
  ./wishful_simple_controller --config ./controller_config.yaml
else
  cd ../simple
  if [ "$TYPE" = "agent" ]; then
    ./wishful_simple_agent --config ./agent_config.yaml
  elif [ "$TYPE" = "controller" ]; then
    ./wishful_simple_controller --config ./controller_config.yaml
  else
    echo "Unknown type! Only agent and controller are valid!"
    exit 1
  fi
fi
