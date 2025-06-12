{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  services = {
    jankyborders = {
      enable = true;
      blur_radius = 5.0;
      hidpi = true;
      active_color = "0xAAB279A7";
      inactive_color = "0x33867A74";
    };
  };
  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;

    brews = [
      "mise"
    ];

    casks = [
      "1password"
      "firefox"
      "ghostty"
      "hammerspoon"
      "lm-studio"
      "obsidian"
      "pomatez"
      "spotify"
      "swish"
      "wezterm"
      "windsurf"
    ];

    # masApps = {
    #   "Drafts" = 1435957248;
    #   "Reeder" = 1529448980;
    #   "Toggl" = 1291898086;
    # };
  };

  system = {
    primaryUser = "ryan"; # Temporary wip
    defaults = {
      dock = {
        autohide = true;
        orientation = "left";
        show-process-indicators = false;
        show-recents = false;
        static-only = true;
      };
      finder = {
        AppleShowAllExtensions = true;
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;
        ShowPathbar = true;
      };
      NSGlobalDomain = {
        AppleKeyboardUIMode = 3;
        "com.apple.keyboard.fnState" = true;
        NSAutomaticWindowAnimationsEnabled = false;
        NSWindowShouldDragOnGesture = true;
        "com.apple.mouse.tapBehavior" = 1; # Trackpad tap-to-click
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        "com.apple.sound.beep.volume" = 0.0; # float value 0 to 1
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };
}
