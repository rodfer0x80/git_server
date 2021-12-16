#!/bin/bash
if [ -z $1 ]; then
	echo -e "Usage: ./make-repo.sh <directory>\n"
	exit
fi
VBOXNET=$(./get-server-ipv4.sh)
REPO=$1
if [ -d $REPO ]; then
	mkdir "$REPO"
fi
cd $REPO
echo "# $1" >> README.md
git init --shared=true
git add .
git commit -m "first commit"
cd ..
git clone --bare $REPO $REPO.git
scp -r $REPO.git git@$VBOXNET:~/git-server/repos
