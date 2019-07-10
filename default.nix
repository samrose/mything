{ pkgs ? import <nixpkgs> {}, ...
}:

let
  mything = pkgs.callPackage ./holonix {};
in

mything // {
  package = mything.package.override(oldAttrs: {
    buildInputs = oldAttrs.buildInputs ++  [ 
      pkgs.openssl.dev 
      pkgs.openssl.out 
      pkgs.clang 
      pkgs.libtool 
      pkgs.autoconf 
      pkgs.automake 
    ];
  });
}
