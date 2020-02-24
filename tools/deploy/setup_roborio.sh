#!/bin/bash

set -Eeuo pipefail

if [ $# != 1 ];
then
  echo "# setup_robot.sh is used to configure a newly flashed roboRIO"
  echo ""
  echo "Usage: setup_roborio.sh 10.54.19.2"
  echo ""
  echo "# or if that does not work, try"
  echo ""
  echo "Usage: setup_roborio.sh roboRIO-5419-frc.local"
  exit 1
fi

readonly ROBOT_HOSTNAME="$1"

# This fails if the code isn't running.
ssh "admin@${ROBOT_HOSTNAME}" 'PATH="${PATH}":/usr/local/natinst/bin/ /usr/local/frc/bin/frcKillRobot.sh -r -t' || true

echo "Deploying robotCommand startup script"
scp aos/config/robotCommand "admin@${ROBOT_HOSTNAME}:/home/lvuser/"