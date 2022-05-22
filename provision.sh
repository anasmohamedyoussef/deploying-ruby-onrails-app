#!/bin/bash
#This is a shell script that starts up the Kubernetes cluster and provision the database
#check if the path is
arg=Kubernetes
cd $arg
for tmp in *
do

 if [[ -d $tmp ]]
 then

  cd $tmp
  echo "Creating Kubernetes Objects in ${tmp} directory"
  ls -1 | xargs -L1 kubectl create -f
  if [[ $? -eq 0 ]];then
  echo "Creathed object at ${tmp} Directory"
  fi
  cd ..

fi
done