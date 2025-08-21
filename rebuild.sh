set -e
alejandra .&> /dev/null
#nvim oatmanpc.nix
git diff -U0 *.nix
echo "NixOS Rebuilding"
sudo nixos-rebuild switch --flake ./#nixi &>nixos-switch.log || (
 cat nixos-switch.log | grep --color error & false)
gen=$(nixos-rebuild list-generations | grep current)
git commit -am "$gen"
popd
