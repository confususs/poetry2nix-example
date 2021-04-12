{ pkgs ? import <nixpkgs> {} }:
let
  myAppEnv = pkgs.poetry2nix.mkPoetryEnv {
    projectDir = ./.;
    editablePackageSources = {
      corePackage= ./core;
      coreConsumer1= ./consumer1;
      coreConsumer2= ./consumer2;
    };
  };
in 
pkgs.mkShell {
  buildInputs = with pkgs; [
    poetry
    myAppEnv
  ];
}
