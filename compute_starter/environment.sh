# Important, persistent user-specific data that should be preserved.
DATA_HOME='export XDG_DATA_HOME="${HOME}/.local/share"'
eval "$DATA_HOME"

# Non-essential, deletable, unimportant cached data.
CACHE_HOME='export XDG_CACHE_HOME="${HOME}/.cache"'
eval "$CACHE_HOME"

# Temporary runtime files not intended for persistence, cleared on reboot.
RUNTIME_DIR='export XDG_RUNTIME_DIR="/run/user/$UID"'
eval "$RUNTIME_DIR"

# Persistent state data like logs, history, and application state.
STATE_HOME='export XDG_STATE_HOME="${HOME}/.local/state"'
eval "$STATE_HOME"

# User-specific configuration files.
CONFIG_HOME='export XDG_CONFIG_HOME="${HOME}/.config"'
eval "$CONFIG_HOME"

###
### Apptainer environment
###

SET_APPTAINER_CACHEDIR='export APPTAINER_CACHEDIR="${XDG_CACHE_HOME}"'
eval "$SET_APPTAINER_CACHEDIR"

# ${XDG_RUNTIME_DIR} is another option. Consider /run/**'s filesystem before using.
SET_APPTAINER_TMPDIR='export APPTAINER_TMPDIR="${XDG_CACHE_HOME}"'
eval "$SET_APPTAINER_TMPDIR"

if [ -n "$APPTAINER_CONTAINER" ] || [ -n "$SINGULARITY_CONTAINER" ] || [ -d "/.singularity.d" ] || [ -d "/.apptainer.d" ]; then
    echo "Running inside an Apptainer/Singularity container"
    echo "$DATA_HOME" >>$APPTAINER_ENVIRONMENT
    echo "$CACHE_HOME" >>$APPTAINER_ENVIRONMENT
    echo "$RUNTIME_DIR" >>$APPTAINER_ENVIRONMENT
    echo "$STATE_HOME" >>$APPTAINER_ENVIRONMENT
    echo "$CONFIG_HOME" >>$APPTAINER_ENVIRONMENT
    echo $SET_APPTAINER_CACHEDIR >>$APPTAINER_ENVIRONMENT
    echo $SET_APPTAINER_TMPDIR >>$APPTAINER_ENVIRONMENT
else
    echo "Not running inside an Apptainer/Singularity container"
fi

## todo fix for app
mkdir -p ${XDG_CONFIG_HOME}/compute
mkdir -p ${XDG_DATA_HOME}/compute
