# my nixos setup
minimal, scuffed setup

# install
```bash
# clone the repo and call the folder nixos
git clone https://github.com/skylerfrags/nixos-config.git nixos

# swap out hardware-configuration.nix
mv /etc/nixos/harware-configuration.nix ~/ # move hardware nix file to home
sudo rm -rf /etc/nixos
rm -rf ~/nixos/modules/core/hardware-configuration.nix
mv ~/hardware-configurations.nix ~/nixos/modules/core/

# last steps
ln -s ~/nixos /etc/
sudo nix-channel --add https://nixos.org/channels/nixos-unstable
sudo nixos-rebuild switch
```
TODO: make an automated install script
