#!/bin/bash
# [wf] run WPS/WRF/UPP
set -ex

# [wf] create output directories
mkdir -p output/wrfprd output/postprd

# [wf] run WPS/WRF/UPP (NWP: pre-proc, model, post-proc) script in docker-space.
docker run --rm -it --volumes-from wps_geog --volumes-from sandy \
 -v ${PWD}/scripts:/scripts \
 -v ${PWD}/output/wrfprd:/wrfprd \
 -v ${PWD}/output/postprd:/postprd \
 --name run-dtc-nwp-sandy ivotron/dtc-nwp /scripts/sandy_20121027/run/run-dtc-nwp.ksh
