{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "cem-tools";
      paths = [
        bash
        bash-completion
        neovim
        nodejs_22
        starship
        fd
        ripgrep
        fzf
      ];
    };
  };
}
