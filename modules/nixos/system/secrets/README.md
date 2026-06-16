# Managing Secrets in NixOS

This repository uses [sops-nix](https://github.com/Mic92/sops-nix) alongside Mozilla's [SOPS](https://github.com/getsops/sops) to securely store and manage encrypted secrets directly in git. 

Secrets are encrypted using an **Age key pair**. 

## ⚠️ CRITICAL WARNING: BACKUP YOUR KEY

Your private Age decryption key is currently stored locally at:
**`/home/rushabhp/.config/sops/age/keys.txt`**

**You MUST securely back up this file immediately.** If you ever reinstall your OS, move to a new laptop, or if your hard drive fails and you don't have this key backed up, **you will permanently lose access to all encrypted secrets in this repository.** Do not commit this file to git!

## Viewing and Editing Secrets

SOPS seamlessly handles the decryption and encryption of files on the fly. To view or edit the `secrets.yaml` file, simply run the following command from the root of the repository:

```bash
nix run nixpkgs#sops -- modules/nixos/secrets/secrets.yaml
```

This will decrypt the file and open it in your `$EDITOR` (usually vim or nano). 
1. Make any changes, such as adding new key-value pairs (e.g. `wifi_password: "MySuperSecretPassword"`).
2. Save and quit the editor.
3. SOPS will automatically re-encrypt the file and save the changes.
4. You can safely `git add` and `git commit` the changes!

## Creating New Secret Files

If you want to create a new secrets file (e.g., `modules/nixos/secrets/tokens.yaml`):

1. Create a dummy unencrypted file:
```bash
echo 'my_token: "12345"' > modules/nixos/secrets/tokens.yaml
```
2. Encrypt it in place using the rules defined in `.sops.yaml`:
```bash
nix run nixpkgs#sops -- -e -i modules/nixos/secrets/tokens.yaml
```
3. Update `sops.nix` or your target module to point to the new file:
```nix
sops.secrets."my_token" = {
  sopsFile = ./secrets/tokens.yaml;
};
```

## Using Secrets in NixOS

Any secret defined in `secrets.yaml` will automatically be loaded by `sops-nix` when the system builds. 

To use a secret named `test_secret` in a module:

```nix
{ config, ... }:
{
  # If it's in the default sops file configured in sops.nix, you just need to declare it:
  sops.secrets."test_secret" = {};

  # Then, refer to its path at runtime:
  environment.etc."my_secret_file".source = config.sops.secrets."test_secret".path;

  # Or use it in a systemd service:
  systemd.services.my_service = {
    serviceConfig.EnvironmentFile = config.sops.secrets."test_secret".path;
  };
}
```

Remember: Secrets are resolved at *runtime*, not build time. They won't be exposed in the `/nix/store`!
