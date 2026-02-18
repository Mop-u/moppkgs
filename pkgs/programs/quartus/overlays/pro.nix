final: prev: {
    quartus-prime-pro = final.callPackage ../quartus.nix {
        quartusSource = {
            variant = "pro";
            version = "25.3.0.109";
            baseUrl = "https://downloads.intel.com/akdlm/software/acdsinst/25.3/109/ib_installers";
            quartusInstaller = "QuartusProSetup";
            defaultInstalls = [ ];
            defaultDevices = [ "cyclone10gx" ]; # The only device family that doesn't need a paid license
            installers = {
                QuartusProSetup = "sha256-Cz1O9AkEgkMdnDhy5G+MO04phTmSquGmbg/F/qGMaOg=";
                QuestaSetup = "sha256-WCbN0l73nlH7CjzjQ2+B0q9KUJKcaiYYxhxQgjMLyeg=";
            };

            installerParts.QuartusProSetup = {
                QuartusProSetup-part2 = "sha256-QqG/bieWb40bbb3bluAiGXZsVa7T/3ZYVjJRZCLS9LU=";
            };

            devices =
                let
                    agilex_common = "sha256-n/Z3Vmbj+JltvhyzPiHFgGVfO/TaA6pHt8Z2yQu5opQ=";
                in
                {
                    agilex3 = {
                        inherit agilex_common;
                        agilex3 = "sha256-Kj/2kiz/Ha29zS4H6rqI9AtFUE9R4wdXGwekNf9obTg=";
                    };
                    agilex5 = {
                        inherit agilex_common;
                        agilex5 = "sha256-ioYbtTV1DpW4jUwLpD3o294W3GXWJvVuunqa6nLr9dI=";
                    };
                    agilex7 = {
                        inherit agilex_common;
                        agilex7 = "sha256-rtuENW1Tg61SwRujmCZVvPbHNIfYaKc/wxqkS3aB2gU=";
                    };
                    arria10 = "sha256-HewRnGsV5LW2hsigZCqd3V5qN8Swl0mP5EptVOfcGU4=";
                    cyclone10gx = "sha256-+iG9x7e/Q8ViV7ljpjQOYMETAExKn8586vXchDandgU=";
                    stratix10 = "sha256-+CaEa1L8xviW405hbOgb6vOAHYAtVPFqXQZJQcLnP1Q=";
                };

            patcher = "${
                final.fetchzip {
                    stripRoot = false;
                    url = "https://community.altera.com/t5/s/jgyke29768/attachments/jgyke29768/knowledge-base/10423.10/2/quartus-25.3-0.27.zip";
                    hash = "sha256-sydAtG+NLAQaTWR9pTitui74I7MjFKr5JQgbHrn0oVk=";
                }
            }/quartus-25.3-0.27-linux.run";

        };
    };
}
