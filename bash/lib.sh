#!/bin/bash
# Library for inclusion in other scripts.
#
# Provides:
# * echo_v: an echo, which checks for VERBOSITY
# * an exit trap to print the code
#
# Example include:
#   readonly BASE_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
#   source "${BASE_DIR}/lib.sh"
#
set -Eeuo pipefail
shopt -s inherit_errexit

trap 'catch_exit $?' EXIT

catch_exit() {
  local -r return_code="${1}"
  [[ "${return_code}" != "0" ]] && echo_v "Error ${return_code} occurred."
  return "${return_code}"
}

# Requires HELP and USAGE to be set in main script
help() { echo "${HELP}" ; }
usage() { echo "${USAGE}"; exit 1 ; }


# verbosity
#  0: silent
#  1: normal output
#  2: verbose output
VERBOSITY=1

# Set the verbosity level (can only be called once)
set_verbosity() {
  local -r verbosity="${1}"

  case $verbosity in
    [0-4]*) VERBOSITY=$verbosity ;;
    *) echo >&2 "Invalid verbosity level"; exit 1 ;;
  esac
  readonly VERBOSITY
}

echo_v() {
  local msg="${1}"
  local log_level="${2:-1}"

  if [[ ${log_level} -le ${VERBOSITY} ]]; then
    echo "${msg}"
  fi
}
