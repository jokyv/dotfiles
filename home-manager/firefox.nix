{ config, lib, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    enableGoogleTalkPlugin = false;
    enableAdobeFlashPlayer = false;
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      bitwarden
      darkreader
      ublock-origin
      privacy-badger
      self-destructing-cookies
    ];
    profiles.default = {
      id = 0;
      settings = {
        # General settings
        "browser.startup.homepage" = "https://www.duckduckgo.com";
        "browser.startup.page" = 2;
        "browser.newtabpage.enabled" = false;
        "browser.newtabpage.dataSource" = "about:blank";
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.tabs.closeWindowWithLastTab" = false;

        # Privacy and security settings
        "privacy.trackingprotection.enabled" = true;
        "network.cookie.cookieBehavior" = 1; # 0=allow all, 1=allow from originating site, 2=no cookies
        "network.http.referer.hideOnionUrl" = true;
        "network.http.referer.spoofSource" = true;
        "network.http.referer.XOriginPolicy" = 2; # 0=send, 1=send if origin matches, 2=send only on same origin
        "network.http.referer.XOriginTrimmingPolicy" = 2; # 0=send full URL, 1=send origin only, 2=trim path

        # Performance settings
        "browser.tabs.remote.autostart" = true;
        "browser.tabs.remote.autostart.2" = true;
        "dom.ipc.processCount" = 8;
        "layers.acceleration.disabled" = false;
        "media.ffmpeg.low-latency.enabled" = true;
        "media.hardware-video-decoding.enabled" = true;
      };
    };
  };
}
