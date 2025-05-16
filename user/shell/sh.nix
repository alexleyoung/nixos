{ pkgs, ... }:
let
  # My shell aliases
  myAliases = {
    ls = "eza --icons -l -T -L=1";
    cat = "bat";

    gt="git";
    gaa="git add .";
    gs="git status -s";
    gcm="git commit -m";
    gp="git push";
    glog="git log --oneline --graph --all";
  };
in
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  programs.zoxide.enable = true;

  home.packages = with pkgs; [
    bat eza zoxide
    zsh-syntax-highlighting
  ];
}
