# my nixos setup
minimal, scuffed setup

# install
```bash
# clone the repo and call the folder nixos
git clone https://github.com/skylerfrags/nixos-config.git nixos

# swap the hardware-configuration.nix file
mv /etc/nixos/hardware-configuration.nix ~/ # move to home
sudo rm -rf /etc/nixos
rm -rf ~/nixos/modules/core/hardware-configuration.nix
mv ~/hardware-configuration.nix ~/nixos/modules/core/

# last steps
ln -s ~/nixos /etc/ # makes symlinks to the default location so you dont need to add extra stuff to the rebuild command or cd into the directory
sudo nix-channel --add https://nixos.org/channels/nixos-unstable
sudo nixos-rebuild switch
```