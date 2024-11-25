#!/bin/bash

# Mount Google Drive
/usr/bin/rclone mount gdrive: /mnt/gdrive --vfs-cache-mode full &

# Mount OneDrive
/usr/bin/rclone mount onedrive: /mnt/onedrive --vfs-cache-mode full &
