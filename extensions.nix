{ lib, newScope, ghidra, ghidra-extensions }:

lib.makeScope newScope (self: {
  inherit (ghidra-extensions.override({ inherit ghidra; })) buildGhidraExtension buildGhidraScripts;

  ret-sync = self.callPackage ./extensions/ret-sync { };

  lightkeeper = self.callPackage ./extensions/lightkeeper { };

})
