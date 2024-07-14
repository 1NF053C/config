export XDG_CONFIG_HOME="~/.config";
mkdir -p ${XDG_CONFIG_HOME}
cd ${XDG_CONFIG_HOME};
rm -rf ./config
git clone https://github.com/1NF053C/config.git;
cd ./config/generate_node_config;
chmod +x ./build.sh;
chmod +x ./run.sh;
./build.sh;
./run.sh;
mkdir -p ~/app;
cp -r ./output/* ~/app;
cd ~/app;
echo ${PWD};
echo "index.ts is app entry point."
echo "Run ./dev-build.sh to build node_app.def.sif;
echo "Run ./dev-run.sh to run node_app.def.sif";
