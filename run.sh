echo "一键搭建脚本"
nix-env -iA nixpkgs.wget
mkdir build
cd build
wget -O replit.nix 
cd ..
wget -O main.sh 
cp -r build/replit.nix .
echo "恭喜搭建完成"
echo "点击Run立即运行项目"
echo "查询用户名及密码运行下面命令"
rm -rf build/
