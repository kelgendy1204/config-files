{ lib, ... }:

{
    programs.git.settings = {
        user.email = lib.mkForce "elgendy1204@outlook.com";
        credential.helper = lib.mkForce "osxkeychain";
    };
}
