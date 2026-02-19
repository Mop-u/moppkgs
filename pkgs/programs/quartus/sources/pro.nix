{ fetchzip }:
let
    variant = "pro";
in
{
    "23.4.0.79" = {
        inherit variant;
        version = "23.4.0.79";
        baseUrl = "https://downloads.intel.com/akdlm/software/acdsinst/23.4/79/ib_installers";

        quartusInstaller = "QuartusProSetup";
        defaultInstalls = [ ];
        defaultDevices = [ "cyclone10gx" ];
        installers = {
            QuartusProSetup = "sha256-Tcsn8WJ8XQG/irmQyMxu2oMgzc0Dj0llAK8UDZ92wpg=";
            QuestaSetup = "sha256-/9z7y5anAhycPb1xFSai75WUHLZJrwmCzvg70EpAWpI=";
        };
        installerParts = {
            QuartusProSetup = {
                QuartusProSetup-part2 = "sha256-slY1K8Vgbd6ntMOyPcrhlUgArgZY5qe15MwvdQsE3q0=";
            };
        };
        devices = {
            agilex7 = "sha256-3VP4amVgED/zZtEWFtsMuIV9ePpD0iOBw1J7CV+6nz8=";
            arria10 = "sha256-rCy03lujkuJmvKlyolKTU8UCYsaDwLQS7HlmDYGJXsM=";
            cyclone10gx = "sha256-azbOsqybxSNwtpp2dlPn0ZMrrFRekWmqtYgCC8kBkZw=";
            easicn5x = "sha256-sEpGbtuEBA/qv8ZOg3XqxfXzfsfMXByWqsDGIJyz0OU=";
            stratix10 = "sha256-oMYV2h/wDeoPEtd0mcw+Rsu2FNXYud1v0IepvJDifYA=";
        };
        patcher = "${
            fetchzip {
                stripRoot = false;
                url = "https://community.altera.com/t5/s/jgyke29768/attachments/jgyke29768/knowledge-base/10423.10/6/quartus-23.4-0.70.zip";
                hash = "";
            }
        }/quartus-23.4-0.70-linux.run";
    };
    "24.3.0.212" = {
        inherit variant;
        version = "24.3.0.212";
        baseUrl = "https://downloads.intel.com/akdlm/software/acdsinst/24.3/212/ib_installers";

        quartusInstaller = "QuartusProSetup";
        defaultInstalls = [ ];
        defaultDevices = [ "cyclone10gx" ];

        installers = {
            QuartusProSetup = "sha256-lM/F013is6Bb1ablFXlK3mQeDHDO2EGWvTlab4LFQVk=";
            QuestaSetup = "sha256-M2nhS51GDcTvNg3dseeijNR+vc5BAIe11hRWB21MUuw=";
        };

        installerParts.QuartusProSetup = {
            QuartusProSetup-part2 = "sha256-nSdX1ip96IphMZSASjnrjGNRBJu3/66za5FLo3Boaq8=";
        };

        devices =
            let
                agilex_common = "sha256-FHbme4d8kWG9KBSxNn+7R6vgTVvxVfA4GDGWG48ytsw=";
            in
            {
                agilex5 = {
                    inherit agilex_common;
                    agilex5 = "sha256-wIJiOanc4ly7MGy5c0NgiW52IR9coxfYh6GRcvJCqR4=";
                };
                agilex7 = {
                    inherit agilex_common;
                    agilex7 = "sha256-TRivhruDwjEV5rZ8bGp1q9gnOOAQlgmnC6sHptj0pwM=";
                };
                arria10 = "sha256-xSIk0Af1AfPHejKlhFM3mpEfsGBieWC4l6TCv2tpd2k=";
                cyclone10gx = "sha256-2OQZ15ovHPPO4/wAKB6BjfskD6VLSDXf9ad4qqcx/VQ=";
                easicn5x = "sha256-oX3Tak9dYmb6bbTHQ1scjYREYNquiusHH0MWTAUUUWQ=";
                stratix10 = "sha256-7NuM6cWBKz6G0Tar5ixDwyAHZ7zanIlJCr0L4S14Wug=";
            };
        patcher = "${
            fetchzip {
                stripRoot = false;
                url = "https://community.altera.com/t5/s/jgyke29768/attachments/jgyke29768/knowledge-base/10423.10/7/quartus-24.3-0.35.zip";
                hash = "";
            }
        }/quartus-24.3-0.35-linux.run";
    };
    "25.1.0.129" = {
        inherit variant;
        version = "25.1.0.129";
        baseUrl = "https://downloads.intel.com/akdlm/software/acdsinst/25.1/129/ib_installers";

        quartusInstaller = "QuartusProSetup";
        defaultInstalls = [ ];
        defaultDevices = [ "cyclone10gx" ];

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
        patcher = "${
            fetchzip {
                stripRoot = false;
                url = "https://community.altera.com/t5/s/jgyke29768/attachments/jgyke29768/knowledge-base/10423.10/9/quartus-25.1-0.36.zip";
                hash = "";
            }
        }/quartus-25.1-0.36-linux.run";
    };
    "25.3.0.109" = {
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
            fetchzip {
                stripRoot = false;
                url = "https://community.altera.com/t5/s/jgyke29768/attachments/jgyke29768/knowledge-base/10423.10/2/quartus-25.3-0.27.zip";
                hash = "sha256-sydAtG+NLAQaTWR9pTitui74I7MjFKr5JQgbHrn0oVk=";
            }
        }/quartus-25.3-0.27-linux.run";
    };
}
