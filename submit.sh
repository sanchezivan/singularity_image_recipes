#!/bin/bash
#COBALT -t 30
#COBALT -q debug
#COBALT -n 2
#COBALT -A visualization

# pass container as first argument to script
CONTAINER=$1

RANKS_PER_NODE=4
TOTAL_RANKS=$(( $COBALT_JOBSIZE * $RANKS_PER_NODE ))

# this simply runs the command 'ldd /myapp/pi' inside the container and should show that
# the app is running agains the host machines Cray libmpi.so not the one inside the container
# run my contianer like an application, which will run '/myapp/pi'
mpirun -n $TOTAL_RANKS -N $RANKS_PER_NODE singularity run -B $CONTAINER
