# Arihant's Dotfiles

These are all the steps I followed to get my PC just the way I like it. 

But first, a brief overview:

| Component | Details |
|-----------|---------|
| Distro    | Fedora KDE Spin 41 |
| Hardware  | HP Spectre x360 2023 |
| DE/WM     | KDE Plasma / Hyprland |
| Kernel    | CachyOS |
| Browser   | Zen |
| Terminal  | Alacritty |
| Shell     | Zsh |
| Prompt    | Starship |
| Status Bar    | Waybar |
| Cursors   | Rose Pine |
| Lockscreen    | Hyprlock |
| Login Manager | SDDM |
| Notifications | Dunst |
| Editor    | Visual Studio Code, micro |
| Font      | MonoLisa, JetBrainsMono Nerd Font, Fira Code, IBM Plex Sans |
| GTK Theme | Breeze-Dark |
| App Launcher | Rofi |
| File Manager | Dolphin |
| Music Player | Spotify |
| Screenshot tool | Hyprshot |
| Wallpaper tool | Hyprpaper |
| System Monitor | btop |
| Cloud Sync | rclone |
| Note-taking | Obsidian |
| Image to text | normcap |

By the end of this guide, you'll have most of these installed and a system that looks like this:

Now, let's get started.

# Step 1: Install Fedora KDE Spin

Pretty self-explanatory. Download the Fedora KDE Spin ISO from the [official website](https://getfedora.org/en/kde/) and flash it to a USB drive using [Balena Etcher](https://www.balena.io/etcher/). Boot into the USB drive and install Fedora KDE Spin.

# Step 2: Update the system

```bash
sudo dnf update -y
```

# Step 3: Install MLFW

I use the My Linux for Work [(MLFW)](https://github.com/mylinuxforwork/hyprland-starter) project to set up my system. It's a script that installs Hyprland and some other stuff.

To use it just run:
```bash
bash <(curl -s https://raw.githubusercontent.com/mylinuxforwork/hyprland-starter/main/setup.sh)
```

# Step 4: Install the rest of the software

Install Zen, Sporify, Steam and Obsidian, normcap from the KDE Discover Store as Flatpaks.

Normcap is used to convert image to text on select.

rclone is used to sync files to the cloud (Google Drive and OneDrive), since Dolphin didn't allow me to login to my Google account for some reason.

I used rofi as my app launcher since it came bundled with MLFW. But I did customise it using [this](https://github.com/adi1090x/rofi) repo. Just follow the steps there and you should be good to go.

Install hyprshot separately since it's not included in the MLFW script.

Install btop, zoxide and starship for the shell. Install NVM if you plan to use Node.js.

Download the MonoLisa and IBM Plex Sans fonts, and the Rose Pine cursors.
Set them using the lxappearance tool.

# Step 5: Configure the system

Copy the dotfiles from this repo to your `.config` folder, replacing the existing files.

Note that you may need to tweak some of the settings. For example, the monitors.conf file in the hypr folder is specific to my setup. You'll need to change the monitor names to match your setup.

The autowall.sh script in the hypr folder is also specific to my setup. You'll need to change the paths to your wallpapers. Add a systemd service to run the script at startup. Also add the command to restart the service to your rofi app launcher.

To add emoji support, copy the bin folder to your ~/Documents folder.
Press <kbd>Alt</kbd> + <kbd>E</kbd> to open the emoji picker. Right click on the Apps button in waybar to see all keyboard shortcuts.

To automatically start rsync at startup, create a systemd service using the `start_r_clone_mounts.sh` script in the `bin` folder.

Copy the `.zshrc`, `.vimrc`, `.nanorc` and `.bashrc` files to your home directory.

# Step 6: Change the kernel

I used the [CachyOS kernel](https://cachyos.org/) because it's optimised and slightly faster than the default Fedora kernel. You can install it using:

```bash
sudo dnf copr enable bieszczaders/kernel-cachyos
sudo dnf install kernel-cachyos kernel-cachyos-devel-matched
```

Reboot and select the CachyOS kernel from the GRUB menu.

# Step 7: Enjoy!
