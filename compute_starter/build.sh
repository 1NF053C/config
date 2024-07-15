# run on host
source ./environment.sh
apptainer build -F --fakeroot ${XDG_DATA_HOME}/compute/compute.sif ${XDG_CONFIG_HOME}/compute/compute.def
