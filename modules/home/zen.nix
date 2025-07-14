{ pkgs, ... }:
{
  programs.zen-browser = {
    enable = true;
    policies = {
      DisablePocket = true;
      OfferToSaveLogins = false;
      DisableTelemetry = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
  };
}