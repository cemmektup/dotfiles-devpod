{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "cem-tools";
      paths = [
        bash-completion
        cmake
        fontforge
        makeWrapper
        pkg-config
        gnumake
        gcc
        libiconv
        autoconf
        automake
        libtool
        neovim
        nodejs_22
        starship
        fd
        ripgrep
        fzf
        fzf-git-sh
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
