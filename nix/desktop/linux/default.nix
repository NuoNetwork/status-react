{ stdenv, pkgs }:

with pkgs;
with stdenv;

let
  baseImage = callPackage ./base-image { };
  appimagekit = callPackage ./appimagekit { };
  linuxdeployqt = callPackage ./linuxdeployqt { inherit appimagekit; };

in
{
  buildInputs = [ appimagekit linuxdeployqt patchelf baseImage ];

  shellHook = ''
    export STATUSREACT_LINUX_BASEIMAGE_PATH="${baseImage}/src"
  '';
}
