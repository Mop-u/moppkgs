final: prev: {
    quartus-prime-pro = final.callPackage ../quartus.nix {
        quartusSource = {
            variant = "pro";
            version = "25.1.0.129";
            baseUrl = "https://downloads.intel.com/akdlm/software/acdsinst/25.1/129/ib_installers";
            quartusInstaller = "QuartusProSetup";
            defaultInstalls = [ ];
            defaultDevices = [ "cyclone10gx" ]; # The only device family that doesn't need a paid license
            installers = {
                QuartusProSetup = "sha256-XXyzRpOyAAi444VcvMlz+tOFo84xN4D/PMBnZtEocII=";
                QuestaSetup = "sha256-jMsVHOjm/3gDaYeODVmxHw4Mvzd0vZIs9aXVyufgbq8=";
            };

            installerParts.QuartusProSetup = {
                QuartusProSetup-part2 = "sha256-lAqZNFoqTUVkL+XeDVxWfWlJU2pL5NtsMPyI6rmZpUo=";
            };

            devices =
                let
                    agilex_common = "sha256-Z9zDhZBoy5whLcCTPasu4HYQt0cZ+m5eI+RjrUhGZsw=";
                in
                {
                    agilex3 = {
                        inherit agilex_common;
                        agilex3 = "sha256-h7C5JOFW6z3c9LVZAdw+wRmN8cWd1KGWPE2qtTQuoqk=";
                    };
                    agilex5 = {
                        inherit agilex_common;
                        agilex5 = "sha256-EkTuoTIXGOkrQStp+6uxay+M8uctENe8BDD0/FGgkdc=";
                    };
                    agilex7 = {
                        inherit agilex_common;
                        agilex7 = "sha256-8wCmguM4BI4X7956e3NXx6a6H1c7P1q3RsJ+gkxGC+E=";
                    };
                    arria10 = "sha256-eNGvikhd9WmesyGBpUMYoJ19iMLs+AGkg0LuK5JJJJA=";
                    cyclone10gx = "sha256-uJBFevtpaC8INeewPUyNh7Y9SJJyhHWZaV5Svuz9sUM=";
                    easicn5x = "sha256-96nn7qD0xGZlcxcCeP4uVCRcM7itqwbG+wL2ZioMu68=";
                    stratix10 = "sha256-IBX7ceTc6/oHcT/RFRVvBlvZEMB3nBt4X33rA+wKn/Q=";
                };
        };
    };
}
