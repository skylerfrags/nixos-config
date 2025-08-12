{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        useOSProber = true;
        device = "nodev";
        efiSupport = true;
      };
    };
  };

  services = {
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;
  };

  ## displayManager.sddm.package = pkgs.kdePackages.sddm; when not using Plasma

  users.users.skyler = {
    isNormalUser = true;
    description = "skyler";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.xwayland.enable = true;

  security.rtkit.enable = true;
  security.polkit.enable = true;


  services.gvfs.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = false;
    extraConfig.pipewire = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.allowed-rates" = [ 48000 ];
        "default.clock.quantum" = 1024;
        "default.clock.min-quantum" = 32;
        "default.clock.max-quantum" = 2048;
        "default.clock.quantum-limit" = 8192;
        "default.clock.quantum-floor" = 4;
      };
    };
  };

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false; # my 3070 Ti should use the open drivers but every time ive used them on nix/arch/fedora etc it leads to an unusable system, idk why
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "uk";

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    noto-fonts-monochrome-emoji
  ];

  fonts.fontconfig = {
    defaultFonts = {
      serif = [ "JetBrainsMono" ];
      sansSerif = [ "JetBrainsMono" ];
      monospace = [ "JetBrainsMono Nerd Font" ];
    };
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than-7d";
  };

  system.stateVersion = "25.05"; # dont change 

}
