# run within container
if [ -n "$APPTAINER_CONTAINER" ] || [ -n "$SINGULARITY_CONTAINER" ] || [ -d "/.singularity.d" ] || [ -d "/.apptainer.d" ]; then
    echo "Running inside an Apptainer/Singularity container"
    source ${XDG_CONFIG_HOME}/compute/environment.sh
    apptainer build -F --fakeroot ${XDG_DATA_HOME}/app/app.sif ${XDG_CONFIG_HOME}/app/app.def
else
    echo "Not running inside an Apptainer/Singularity container"
fi
