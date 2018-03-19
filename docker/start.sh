#!/bin/bash

cd examples/simple
./wishful_simple_agent --config ./agent_config.yaml &
./wishful_simple_controller --config ./controller_config.yaml
