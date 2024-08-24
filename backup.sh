#!/bin/bash

# Define backup directory and filename
BACKUP_DIR="/home/ubuntu/kube-kustomize/backup-kustomize"  # Specify your backup directory path
TIMESTAMP=$(date +"%Y%m%d%H%M")
BACKUP_FILE="$BACKUP_DIR/etcd-backup-$TIMESTAMP.tar.gz"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Back up the database
sudo k3s etcd snapshot save $BACKUP_FILE

# Optionally, back up manifests
#kubectl get all --all-namespaces -o yaml > "$BACKUP_DIR/k3s-manifests-$TIMESTAMP.yaml"

echo "Backup completed: $BACKUP_FILE"
