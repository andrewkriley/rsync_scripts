#/bin/bash
# -M 20000 is the monitor port used by autossh
# -R ssh remote fowarding, 2222 remote port, on localhost, to service ssh/22 
# usr@hostname is the destination server (jump host) 
# -nNTp 443 ; tell the jump host not to expect any ssh commands, and initiate the ssh connection to the jump host on port 443
# & background this process

# the actual command to run

autossh -M 20000 -f -R 2222:localhost:22 usr@hostname -nNTp 443 &
