if [ -n "$APPTAINER_CONTAINER" ] || [ -n "$SINGULARITY_CONTAINER" ] || [ -d "/.singularity.d" ] || [ -d "/.apptainer.d" ]; then
    echo "compute container"
    COMPUTE_INPUTDIR="/scif/apps/compute/data/input"
    COMPUTE_OUTPUTDIR="/scif/apps/compute/data/output"

    mkdir -p "${COMPUTE_INPUTDIR}"
    mkdir -p "${COMPUTE_OUTPUTDIR}"

    SET_COMPUTE_INPUTDIR='export COMPUTE_INPUTDIR="'${COMPUTE_INPUTDIR}'"'
    eval "$SET_COMPUTE_INPUTDIR"

    SET_COMPUTE_OUTPUTDIR='export COMPUTE_OUTPUTDIR="'${COMPUTE_OUTPUTDIR}'"'
    eval "$SET_COMPUTE_OUTPUTDIR"

    echo "$SET_COMPUTE_INPUTDIR" >>$APPTAINER_ENVIRONMENT
    echo "$SET_COMPUTE_OUTPUTDIR" >>$APPTAINER_ENVIRONMENT
fi
