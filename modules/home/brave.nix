{ pkgs, ... }:
{
  programs.brave = {
    enable = true;

    extensions = [
        { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origin
        { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
        { id = "ammjkodgmmoknidbanneddgankgfejfh"; } # 7TV
        { id = "jghecgabfgfdldnmbfkhmffcabddioke"; } # Volume Master
        { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # SponsorBlock
        { id = "bkkmolkhemgaeaeggcmfbghljjjoofoh"; } # Catppuccin Mocha Theme
    ];
  };
}