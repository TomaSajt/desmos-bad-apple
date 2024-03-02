{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  packages = with pkgs; [ yt-dlp ffmpeg potrace jq ];
}
