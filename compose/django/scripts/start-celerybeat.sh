#!/bin/sh

set -o errexit
set -o nounset

echo "-> Installing plugins.."
for plugin in ${TOPOBANK_PLUGINS}; do
  echo "* ${plugin}"
  pip install -e /development-stack/${plugin}
done

echo "-> Starting Celery beat.."

rm -f './celerybeat.pid'
celery -A topobank.taskapp beat -l INFO
