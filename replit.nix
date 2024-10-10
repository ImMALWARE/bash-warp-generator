{ pkgs }: {
  deps = [
    pkgs.wireguard-tools
    pkgs.jq
    pkgs.bashInteractive
    pkgs.nodePackages.bash-language-server
  ];
}