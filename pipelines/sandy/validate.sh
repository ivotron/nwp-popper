#!/bin/bash
# [wf] Generate output plots and validate using MET
set -ex

# [wf] create output directories
mkdir -p output/nclprd output/metprd

# [wf] Run NCL with user scipt
docker run --rm -it \
 -v ${PWD}/scripts:/scripts \
 -v ${PWD}/output/wrfprd:/wrfprd \
 -v ${PWD}/output/nclprd:/nclprd \
 --name run-dtc-ncl-sandy ivotron/dtc-ncl /scripts/sandy_20121027/run/ncl_run_all.ksh

# [wf] Run MET script in docker-space.
docker run --rm -it --volumes-from sandy \
 -v ${PWD}/scripts:/scripts \
 -v ${PWD}/output/postprd:/postprd \
 -v ${PWD}/output/metprd:/metprd \
 --name run-dtc-met-sandy ivotron/dtc-met /scripts/sandy_20121027/run/run-dtc-met.ksh
