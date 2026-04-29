{ self, ... }:

{
    imports = [
        ../../modules/darwin
    ];

    users.users.kelgendy.home = "/Users/kelgendy";

    system.configurationRevision = self.rev or self.dirtyRev or null;
    system.stateVersion = 6;
    system.primaryUser = "kelgendy";

    nixpkgs.hostPlatform = "aarch64-darwin";
}
