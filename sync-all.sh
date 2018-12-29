#!/bin/bash

shellDir=$(cd "$(dirname "$0")"; pwd)
repo_path=${shellDir}

echo ">>> Current path is ${repo_path}"
for line in `cat ${repo_path}/config.txt`
do
{
    if [ "${line:0:1}" == "#" ]; then
        continue
    else
        echo $line
        cd ${repo_path}
        array=(${line//,/ }) 
        origin_repo=(${array[0]})
        fork_repo=(${array[1]})
        sh ./sync-repo.sh ${origin_repo} ${fork_repo}
    fi
}&
done
wait
