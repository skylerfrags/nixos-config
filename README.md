# my nixos setup
minimal, scuffed setup

# install
```bash
# clone the repo and call the folder nixos
git clone https://github.com/skylerfrags/nixos-config.git nixos

# replace hardware-configuration.nix
rm ~/nixos/hardware-configuration.nix
mv /etc/nixos/hardware-configuration.nix ~/nixos 

# replace config
sudo rm -rf /etc/nixos
ln -s ~/nixos /etc/ # makes symlinks to the default location

sudo nix-channel --add https://nixos.org/channels/nixos-unstable
sudo nixos-rebuild switch
```
