#!/bin/bash
cd /root/.openclaw/workspace/mc-server
exec java -Xmx2G -Xms1G -jar server.jar nogui
