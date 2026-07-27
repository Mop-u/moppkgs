{ fetchzip, lib }:
let
  helpers = import ./helpers.nix;
  sources = helpers.mkVariants "lite" [
    {
      version = "23.1std.1.993";
      baseUrl = "https://downloads.intel.com/akdlm/software/acdsinst/23.1std.1/993/ib_installers";
      quartusInstaller = "QuartusLiteSetup";
      defaultInstalls = [ ];
      defaultDevices = [ "cyclonev" ];
      installers = {
        QuartusLiteSetup = "sha256-OCp2hZrfrfp1nASuVNWgg8/ODRrl67SJ+c6IWq5eWvY=";
        QuestaSetup = "sha256-Dne4MLFSGXUVLMd+JgiS/d5RX9t5gs6PEvexTssLdF4=";
      };
      devices = {
        arria_lite = "sha256-PNoc15Y5h+2bxhYFIxkg1qVAsXIX3IMfEQSdPLVNUp4=";
        cyclone = "sha256-2huDuTkXt6jszwih0wzusoxRvECi6+tupvRcUvn6eIA=";
        cyclone10lp = "sha256-i8VJKqlIfQmK2GWhm0W0FujHcup4RjeXughL2VG5gkY=";
        cyclonev = "sha256-HoNJkcD96rPQEZtjbtmiRpoKh8oni7gOLVi80c1a3TM=";
        max = "sha256-qh920mvu0H+fUuSJBH7fDPywzll6sGdmEtfx32ApCSA=";
        max10 = "sha256-XOyreAG3lYEV7Mnyh/UnFTuOwPQsd/t23Q8/P2p6U+0=";
      };
    }
    {
      version = "24.1std.0.1077";
      baseUrl = "https://downloads.intel.com/akdlm/software/acdsinst/24.1std/1077/ib_installers";
      quartusInstaller = "QuartusLiteSetup";
      defaultInstalls = [ ];
      defaultDevices = [ "cyclonev" ];
      installers = {
        QuartusLiteSetup = "sha256-NFWT1VWcb3gun7GhpPbHzR3SIYBMpK40jESXS/vC5II=";
        QuestaSetup = "sha256-4+Y34UiJwenlIp/XKzMs+2aYZt/Y6XmNmiYyXVmOQkc=";
      };
      devices = {
        arria_lite = "sha256-ASvi9YX15b4XXabGjkuR5wl9wDwCijl8s750XTR/4XU=";
        cyclone = "sha256-iNA4S5mssffgn29NUhibJk6iKnmJ+vG9LYY3W+nnqcI=";
        cyclone10lp = "sha256-247yR2fm5A3LWRjePJU99z1NBYziV8WkPL05wHJ4Z1Q=";
        cyclonev = "sha256-Fa1PQ3pp9iTPYQljeKGyxHIXHaSolJZR8vXVb3gEN7g=";
        max = "sha256-lAA1CgSfAjfilLDhRzfU2OkzGAChk7TMFckeboMB4mI=";
        max10 = "sha256-edycBj0P3qwLN2YS//QpCHQeGOW8WM0RqTIWdGAkEv8=";
      };
    }
    {
      version = "25.1std.0.1129";
      baseUrl = "https://downloads.intel.com/akdlm/software/acdsinst/25.1std/1129/ib_installers";
      quartusInstaller = "QuartusLiteSetup";
      defaultInstalls = [ ];
      defaultDevices = [ "cyclonev" ];
      installers = {
        QuartusLiteSetup = "sha256-UYQz7H3NYXJVYK9lM1P3pcMgzOnlKLInR7io3zZ0xOs=";
        QuestaSetup = "sha256-0F7psE+jTimCoy+UVJRgxNC6GEVdY/PJu49hf+D7T3U=";
      };
      devices = {
        arria_lite = "sha256-Epxvu1z7Z4vQWASIYEJAy5P7Meee114ZNVIAZnmTEH8=";
        cyclone10lp = "sha256-lurSlhCuE6i2ULKNFvlWNtk6rqdvVwREC607HbMSH2I=";
        cyclone = "sha256-lKOYy61BHxY4OyonxADg6d7IGwckGX8zu0x6dpGB5Lo=";
        cyclonev = "sha256-1uSE/RsKR3hbyLzTGOQn1Ml5j5J26e+SmFI1hl9ry28=";
        max10 = "sha256-gFeESwuRwrp+8rN7GYbRmOxPGDHMm+ClLRjl/rTBnOk=";
        max = "sha256-jY/b906fJKgJOL3h5nWR5RQdvAJ3U9of6y4VopGo2z0=";
      };
    }
  ];
in
helpers.setupSources sources
