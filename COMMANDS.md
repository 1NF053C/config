## build

sudo apptainer build generate_weekly_default_nextjs_app.sif generate_weekly_default_nextjs_app.def

## run once

apptainer run --contain --bind ./:/repo generate_weekly_default_nextjs_app.sif

## persistant execution

apptainer instance start --contain --bind ./:/repo generate_weekly_default_nextjs_app.sif gen_weekly_nextjs_updater
