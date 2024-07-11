## build

sudo apptainer build generate_weekly_default_nextjs_app.sif generate_weekly_default_nextjs_app.def

## run once

apptainer run --bind $REPO_PATH:/repo generate_weekly_default_nextjs_app.sif

## persistant execution

apptainer instance start --bind $REPO_PATH:/repo generate_weekly_default_nextjs_app.sif gen_weekly_nextjs_updater
