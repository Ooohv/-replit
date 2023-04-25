echo "Alist一键搭建脚本"
nix-env -iA nixpkgs.wget
mkdir build
cd build
wget -O .replit https://github.com/Ooohv/-replit/blob/main/.replit
wget -O replit.nix https://github.com/Ooohv/-replit/blob/main/replit.nix
cp -r build/.replit . && cp -r build/replit.nix .
rm -rf build/
