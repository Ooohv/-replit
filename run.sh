echo "一键搭建脚本"
nix-env -iA nixpkgs.wget
cd build
wget -O replit.nix https://github.com/Ooohv/-replit/blob/main/replit.nix
cd ..
wget -O main.sh https://github.com/sxbai/alist-on-replit/raw/master/main.sh
cp -r build/.replit . && cp -r build/replit.nix .
echo "恭喜搭建完成"
echo "点击Run立即运行项目"
echo "查询用户名及密码运行下面命令"
echo "./sx admin"
rm -rf build/
