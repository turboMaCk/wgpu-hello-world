{ pkgs ? import <nixpkgs> {} }:
with pkgs;
let
  libPath = with xorg; lib.makeLibraryPath [
    vulkan-loader
    wayland
    wayland-protocols
    libxkbcommon
    libX11
    libXrandr
    libXi
    libXcursor
  ];
in
  mkShell {
    buildInputs = with xorg; [
      openssl
      wayland
      wayland-protocols
      libxkbcommon
      libX11
      libXrandr
      libXi
      libXcursor
    ];

    # ENV
    LD_LIBRARY_PATH = libPath;
  }
