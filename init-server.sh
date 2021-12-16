#!/bin/bash
docker run -d -p 2222:22 -v ~/.config/keys:/git-server/keys -v ~/Projects/private-cloud:/git-server/repos jkarlos/git-server-docker
