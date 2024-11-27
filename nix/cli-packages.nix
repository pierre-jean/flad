{ pkgs, ...}:
	with pkgs;
[
    # nix # If not on NixOS, this is important!
    nh
    stow

    # Doesn't work as a profile
    # (nerdfonts.override { fonts = ["JetBrainsMono"]; }) # not sure if it works if not put in fonts.packages

    glibcLocales

    ### builds essentials ###
    stdenv
    gcc
    gnumake
    automake

    ### shells ###
    bash
    dash
    nushell
    zsh
    starship

    ### editors ###
    ed
    neovim
    kakoune
    helix

    ### utils ###
    coreutils
    tree
    ripgrep
    fzf
    xe
    xplr
    skim
    fd
    lazygit

    ### multiplexers ###
    tmux
    zellij

    ### files ###
    zoxide
    yazi
    xplr
    encfs
    sshfs
    udiskie

    ### media ###
    chafa
    libsixel
    mpv
    ffmpeg
    imagemagick
    yt-dlp
    yewtube

    ### network ###
    curl
    wget
    tailscale

    ### ai ###
    aichat

    ### mail ###
    aerc

    ### chat ###
    ii
    weechat

    ### browser ###
    ddgr
    w3m
    amfora

    ### bluetooth
    bluez
    bluez-tools
]
