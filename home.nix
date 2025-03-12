{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./plasma.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "matt";
  home.homeDirectory = "/home/matt";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/matt/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.bash = {
    enable = true;
    historyFile = "$HOME/.local/share/.bash_history";
    enableCompletion = true;
    shellAliases = {
      init-mattnix = "mkdir $HOME/Nixstuff && git clone https://github.com/Ghx0sty/nix-dots $HOME/Nixstuff";
      update-nix = "temp=$(pwd) && cd $HOME/Nixstuff && ./update-config.sh && cd $temp";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    shellAliases = {
      init-mattnix = "mkdir $HOME/Nixstuff && git clone https://github.com/Ghx0sty/nix-dots $HOME/Nixstuff";
      update-nix = "temp=$(pwd) && cd $HOME/Nixstuff && ./update-config.sh && cd $temp";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
      theme = "xiong-chiamiov-plus";
    };
  };

  programs.kitty = {
    enable = true;
    extraConfig = "
  font_size 10
  background #163f5b
  background_opacity 0.97
  foreground #509fd3
  cursor #ffcc66
  selection_background #343f4c
  color0 #191e2a
  color8 #686868
  color1 #ed8274
  color9 #f28779
  color2  #a6cc70
  color10 #bae67e
  color3  #fad07b
  color11 #ffd580
  color4  #6dcbfa
  color12 #73d0ff
  color5  #cfbafa
  color13 #d4bfff
  color6  #90e1c6
  color14 #95e6cb
  color7  #c7c7c7
  color15 #ffffff
  selection_foreground #212733
  ";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
