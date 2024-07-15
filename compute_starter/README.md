# compute starter

this is pseudo code for now, wrote it without internet / testing it.

might be replaced with multi stage build defs

```
./build.sh

builds compute.sif image at ${XDG_DATA_HOME}/compute which itself has an app.sif image within at ${XDG_DATA_HOME}/app

./run.sh

runs app.sif container within compute.sif container
```
