#!/bin/sh

echo "post start hook:"
cmd="${RELEASE_ROOT_DIR}/bin/edistillery command Elixir.Edistillery.ReleaseTasks migrate_post"
echo "cmd: ${cmd}"
output=`eval ${cmd}`
echo ${output}
echo "/finished"
