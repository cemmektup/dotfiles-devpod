{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "cem-tools";
      paths = [
        bash-completion
        neovim
        nodejs_22
        starship
        fd
        ripgrep
        fzf
        bat
        jq
        tree
	stow
	python3
        tmux
        lua5.3
        luarocks
      ];
    };
  };
}
