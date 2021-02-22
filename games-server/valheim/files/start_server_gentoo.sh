#!/bin/bash
# Valheim start-up script based on 'start_server.sh' as of 2021-02-21.  This
# will likely need updating in newer game versions.
export LD_LIBRARY_PATH=/opt/valheim/linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

# FIXME: Stupid hack for supervisor-daemon not exporting environment variables.
. /etc/conf.d/valheim

/opt/valheim/valheim_server.x86_64 -name "${NAME}" -port "${PORT}" -world "${WORLD}" -password "${PASSWORD}" -savedir /var/opt/valheim
