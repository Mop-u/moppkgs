final: prev: {
    quartus-prime-standard = final.callPackage ../quartus.nix {
        quartusSource = {
            variant = "standard";
            version = "23.1std.1.993";
            baseUrl = "https://downloads.intel.com/akdlm/software/acdsinst/23.1std.1/993/ib_installers";

            quartusInstaller = "QuartusSetup";
            defaultInstalls = [ ];
            defaultDevices = [ "cyclonev" ];
            installers = {
                QuartusSetup = "sha256-wWM4DE4SCda+9bKWOY+RXez3ht0phBI/zeFKa5TzhrA=";
                QuestaSetup = "sha256-Dne4MLFSGXUVLMd+JgiS/d5RX9t5gs6PEvexTssLdF4=";
            };
            devices = {
                arria = "sha256-yl5Oo1X0eSlTHfVZnUnvytcP575g8n/wAZDbMjePU5c=";
                arria10 = "sha256-ahBSHA3Tq3Z3DXqXJlyBLKcdyXQzNRqpkdsUbQI4cEM=";
                arriav = "sha256-Rv8lxMBrx1aQOlalFT1+J2DBUYHGHn8twfj3dpLAv/o=";
                arriavgz = "sha256-eDC7rcL/WzXXECeSNDSvG1Heo+1kjr0fus1wxpcaebI=";
                cyclone = "sha256-2huDuTkXt6jszwih0wzusoxRvECi6+tupvRcUvn6eIA=";
                cyclone10lp = "sha256-i8VJKqlIfQmK2GWhm0W0FujHcup4RjeXughL2VG5gkY=";
                cyclonev = "sha256-HoNJkcD96rPQEZtjbtmiRpoKh8oni7gOLVi80c1a3TM=";
                max = "sha256-qh920mvu0H+fUuSJBH7fDPywzll6sGdmEtfx32ApCSA=";
                max10 = "sha256-XOyreAG3lYEV7Mnyh/UnFTuOwPQsd/t23Q8/P2p6U+0=";
                stratixiv = "sha256-1UoJDaaiOFshs7i9B/JdIkGUXF863jYiFNObNX71cJY=";
                stratixv = "sha256-Pi5MpgadLGqCr8xcsy80U5ZLpP1sI/dr8gNyTIvu+5k=";
            };
        };
    };
}
