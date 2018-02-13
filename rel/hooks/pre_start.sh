#!/bin/sh

echo "pre start hook:"
cmd="${RELEASE_ROOT_DIR}/bin/edistillery command Elixir.Edistillery.ReleaseTasks migrate_pre"
echo "cmd: ${cmd}"
output=`eval ${cmd}`
echo ${output}
echo "/finished"
