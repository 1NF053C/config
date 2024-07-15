export XDG_CONFIG_HOME="${HOME}/.config"
mkdir -p ${XDG_CONFIG_HOME}
cd ${XDG_CONFIG_HOME} && {
    rm -rf ${XDG_CONFIG_HOME}/config
    git clone https://github.com/1NF053C/config.git
    cd ./config/node_typescript_starter
    chmod +x ./build.sh
    chmod +x ./run.sh
    ./build.sh
    ./run.sh
    mkdir -p ${HOME}/app
    cp -r ./output/* ${HOME}/app
    cd ${HOME}/app
    echo ${PWD}
    echo "cd ${HOME}/app to change to app root dir"
    echo "index.ts is app entry point."
    echo "Run ./build-dev.sh to build node_app.def.sif"
    echo "Run ./run-dev.sh to run node_app.def.sif"
}
