#!/bin/bash

#$1 执行命令
#$2 进程数量
#$3 restart 或者没有
function main() {
  RUN_PATH=$1
  PROCESSNUM=$2
  COMMAND=$3

  if [[ $COMMAND == "restart" ]]; then
    OLD_PROCESS_PID=$(ps -ef | grep "$RUN_PATH" | grep -v "grep" | awk '{print $2}')
    if [ -n "$OLD_PROCESS_PID" ]; then
      $(kill -9 $OLD_PROCESS_PID)
      echo -e "$RUN_PATH kill process_pid list:\n$OLD_PROCESS_PID"
      startProcess "$RUN_PATH" $PROCESSNUM
    fi
  else
    if [ $(ps aux | grep -v "grep" | grep -c "$RUN_PATH") == $PROCESSNUM ]; then
      PROCESS_PID=$(ps -ef | grep "$RUN_PATH" | grep -v "grep" | awk '{print $2}')
      echo "$RUN_PATH running normally and pid = $PROCESS_PID"
    else
      COUNT_PROCESS_NUM=$(ps aux | grep -v "grep" | grep -c "$RUN_PATH")
      PROCESSNUM=$((PROCESSNUM - COUNT_PROCESS_NUM))
      startProcess "$RUN_PATH" $PROCESSNUM
    fi
  fi
}

#$1 执行命令
#$2 运行进程数量
function startProcess() {
  RUN_PATH=$1
  PROCESSNUM=$2

  for ((i = 1; i <= $PROCESSNUM; i++)); do
    $RUN_PATH >/var/log/shell.log 2>&1 &
  done
  NEW_PROCESS_PID=$(ps -ef | grep "$RUN_PATH" | grep -v "grep" | awk '{print $2}')
  echo -e "$RUN_PATH start new pid list:\n$NEW_PROCESS_PID"
}

main "php test2.php" 3 $1
#main "php test1.php" $1
