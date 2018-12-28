#!/bin/bash
# Sync one repo 
origin_repo=$1
fork_repo=$2
echo "------------"
echo ">>>  sync from ${origin_repo} to ${fork_repo}"

fork_path=${fork_repo/:/\/}
echo ">>>  fork path is ${fork_path} "
if [ ! -d ${fork_path} ]; then
    # git clone git@github.com:sofastack/sofa-rpc github.com/sofastack/sofa-rpc
    git clone "git@${fork_repo}" ${fork_path}
fi
cd ${fork_path}
git remote add upstream "git@${origin_repo}"
git remote -v
git fetch -p --all

git merge upstream/master -q
# 提交到fork master
git push origin master
git push origin --tags
echo "------------"
echo 

