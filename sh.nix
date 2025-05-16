{ config, pkgs, ... }:
let
  myAliases = {
    "c" = "clear";

    "gaa" "git add .";
    "gcm" "git commit -m";
    "gp" "git push";
    "gs" "git status -s";
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
