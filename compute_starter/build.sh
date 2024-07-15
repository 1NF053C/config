source ./compute_environment.sh
cp -f ./compute_environment.sh ${XDG_CONFIG_HOME}/compute/
cp -f ./compute.def ${XDG_CONFIG_HOME}/compute/
apptainer build -F --fakeroot ${XDG_DATA_HOME}/compute/compute.sif ${XDG_CONFIG_HOME}/compute/compute.def
