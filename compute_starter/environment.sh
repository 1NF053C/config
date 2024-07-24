if [ -n "$APPTAINER_CONTAINER" ] || [ -n "$SINGULARITY_CONTAINER" ] || [ -d "/.singularity.d" ] || [ -d "/.apptainer.d" ]; then
    export APPTAINER_TMPDIR="/scif/tmp"
    export APPTAINERENV_COMPUTE_INPUTDIR="/scif/apps/compute/data/input"
    export APPTAINERENV_COMPUTE_OUTPUTDIR="/scif/apps/compute/data/output"

    mkdir -p "${APPTAINER_TMPDIR}"
    mkdir -p "${APPTAINERENV_COMPUTE_INPUTDIR}"
    mkdir -p "${APPTAINERENV_COMPUTE_OUTPUTDIR}"
fi
