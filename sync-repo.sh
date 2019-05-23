#!/bin/bash
# Sync one repo 
origin_repo=$1
fork_repo=$2
echo "------------"
echo ">>>  sync from ${origin_repo} to ${origin_repo}"

origin_path=${origin_repo/:/\/}
echo ">>>  origin path is ${origin_path} "
if [ ! -d ${origin_path} ]; then
    # git clone git@github.com:alipay/sofa-rpc github.com/alipay/sofa-rpc
    git clone "git@${origin_repo}" ${origin_path}
fi
cd ${origin_path}
git fetch -p --all
git pull --all
echo ">>>  push mirror and tags to git@${fork_repo}"
git push --mirror git@${fork_repo}
git push --tags git@${fork_repo}
echo
