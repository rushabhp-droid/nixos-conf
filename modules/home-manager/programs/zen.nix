{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
let
  firefox-addons = inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  options.homeModules.programs.zen.enable = lib.mkEnableOption "zen";
  imports = [ inputs.zen-browser.homeModules.twilight ];
  config = lib.mkIf config.homeModules.programs.zen.enable {

    stylix.targets.zen-browser.profileNames = [ "default" ];

    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;

      profiles.default = {
        extensions.packages = with firefox-addons; [
          ublock-origin
          canvasblocker
          sponsorblock
          privacy-badger
          clearurls
          return-youtube-dislikes
        ];
      };

      policies = {
        AutofillAddressEnabled = true;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
      };

    };
  };
}
