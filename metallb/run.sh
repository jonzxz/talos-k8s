#!/bin/bash

# helm repo add metallb https://metallb.github.io/metallb
helm upgrade --install metallb metallb/metallb -f values.yaml -n metallb
