{ config, pkgs, ... }:
let
  myAliases = {
    "ll" = "ls -l";
    ".." = "cd ..";
    "c" = "clear";
  };
in
{
  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.zoxide = {
    enable = true;
  };
}
