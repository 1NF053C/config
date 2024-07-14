[ -f ./node_app.dev.sif ] && rm ./node_app.dev.sif
apptainer build --fakeroot node_app.dev.sif node_app.dev.def
