#!/usr/bin/env bash

binDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${binDir} && cd ../
curDir=`pwd`

if [ ! -n "$PRO_PATH" ]; then
    export PRO_PATH="${curDir}"
fi

profiles=$2
rootDir=${curDir}
libPath=${rootDir}/lib
sourcePath=${rootDir}/conf
logPath=${rootDir}/logs

export PRO_PATH="${curDir}"
export ModuleName="platform"

if [ ! -d ${logPath} ]; then
    mkdir -p ${logPath}
fi


start() {
    echo "start ${ModuleName}..."
    nohup java -Dloader.path=${libPath},${sourcePath} \
    -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=10039 \
    -XX:+UseConcMarkSweepGC -Xmx2048m -Xms1024m  -XX:+PrintGCDateStamps -XX:+PrintGCDetails  -Xloggc:${logPath}/java_gc.log \
    -XX:-HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=${logPath} -jar ${libPath}/platform-1.0-SNAPSHOT.jar \
    --spring.profiles.active=${profiles} --isJar=true &>${logPath}/${ModuleName}.log &
}
stop() {
    Pid=`ps -ef | grep ${libPath}/platform-1.0-SNAPSHOT.jar | grep -v grep | awk '{print $2}'`
    echo "stop ${ModuleName}..."
    if [ -n "${Pid}" ]
    then
        kill -9 $Pid
    fi
}

restart() {
    stop
    start
}

case "$1" in
	start|stop|restart)
  		case "$2" in
  		    cmb|haizhi|test|uat)
  		        $1
  		        ;;
  		    *)
  		        echo $"Usage: $0 {start|stop|restart} {cmb|haizhi|test|uat}"
  		        exit 2
  		esac
		;;
	*)
		echo $"Usage: $0 {start|stop|restart}"
		exit 1
esac
