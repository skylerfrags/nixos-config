{ pkgs, ... }:
{
  stylix = { ## theme list https://tinted-theming.github.io/tinted-gallery/
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  };
}