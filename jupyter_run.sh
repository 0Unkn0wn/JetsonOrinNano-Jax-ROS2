#!/bin/bash
### Running jupyter lab without password or token

jupyter lab --allow-root --ServerApp.token='' --ServerApp.password=''
