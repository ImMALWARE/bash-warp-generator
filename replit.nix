{ pkgs }: {
  deps = [
    pkgs.bash
    pkgs.wireguard-tools
    pkgs.jq
    pkgs.bashInteractive
    pkgs.nodePackages.bash-language-server
    pkgs.coreutils
    pkgs.curl
    pkgs.qrencode
  ];
}