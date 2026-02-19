{ fetchzip }:
let
    variant = "lite";
in
{
    "23.1std.1.993" = {
        inherit variant;
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
    };

    "24.1std.0.1077" = {
        inherit variant;
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
    };

}
