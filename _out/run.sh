#!/bin/bash
# ref: https://www.talos.dev/v1.7/talos-guides/install/virtualized-platforms/proxmox/#install-talosctl


# Control plane init
talosctl gen config talos-proxmox-cluster https://$CONTROL_PLANE_IP:6443 --output-dir .
talosctl apply-config --insecure --nodes $CONTROL_PLANE_IP --file ./controlplane.yaml

# worker node init
talosctl apply-config --insecure --nodes $WORKER_IP --file ./worker.yaml

# Control plane bootstrap
TALOSCONFIG="./talosconfig"
talosctl config endpoint $CONTROL_PLANE_IP
talosctl config node $CONTROL_PLANE_IP
talosctl bootstrap
talosctl kubeconfig .
