#!/bin/bash
# shellcheck disable=SC2034

# list of repository
# excluding rose-vm

REPO_NAMES[$i]="rose-vm-build"
GIT_BASE[$i]="$GITHUB_NETGROUP"
LOCAL_NAME[$i]="rose-vm-build"
LOCAL_PATH[$i]="$ROSE_SYSTEM"
i=$((i+1))

REPO_NAMES[$i]="rose-srv6-tutorial"
GIT_BASE[$i]="$GITHUB_NETGROUP"
LOCAL_NAME[$i]="rose-srv6-tutorial"
LOCAL_PATH[$i]="$WORKSPACE"
i=$((i+1))

REPO_NAMES[$i]="rose-srv6-control-plane"
GIT_BASE[$i]="$GITHUB_NETGROUP"
LOCAL_NAME[$i]="rose-srv6-control-plane"
LOCAL_PATH[$i]="$WORKSPACE"
i=$((i+1))

REPO_NAMES[$i]="rose-srv6-data-plane"
GIT_BASE[$i]="$GITHUB_NETGROUP"
LOCAL_NAME[$i]="rose-srv6-data-plane"
LOCAL_PATH[$i]="$WORKSPACE"
i=$((i+1))

REPO_NAMES[$i]="rose-srv6-pm-flask"
GIT_BASE[$i]="$GITHUB_NETGROUP"
LOCAL_NAME[$i]="rose-srv6-pm-flask"
LOCAL_PATH[$i]="$WORKSPACE"
i=$((i+1))
REPO_NAMES[$i]="rose-dashboard"
GIT_BASE[$i]="$GITHUB_NETGROUP"
LOCAL_NAME[$i]="rose-dashboard"
LOCAL_PATH[$i]="$WORKSPACE"
i=$((i+1))
REPO_NAMES[$i]="rose-srv6-pm-dockerized"
GIT_BASE[$i]="$GITHUB_NETGROUP"
LOCAL_NAME[$i]="rose-srv6-pm-dockerized"
LOCAL_PATH[$i]="$WORKSPACE"
i=$((i+1))
