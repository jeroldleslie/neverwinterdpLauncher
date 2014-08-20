set -x
git clone https://github.com/jeroldleslie/DemandCubePlaybooks.git
cd DemandCubePlaybooks
git clone https://github.com/DemandCube/ansible-flow.git
mv -f  ./ansible-flow/library/ ./library
rm -rf ./ansible-flow

rm -rf ./roles/neverwinterdp/files


mkdir ./roles/neverwinterdp/files
mkdir ./roles/neverwinterdp/files/workspace

cd ./roles/neverwinterdp/files/workspace

git clone https://github.com/DemandCube/NeverwinterDP-Commons
git clone https://github.com/DemandCube/Queuengin
git clone https://github.com/DemandCube/Sparkngin
git clone https://github.com/DemandCube/Scribengin
git clone https://github.com/DemandCube/Demandspike
git clone https://github.com/DemandCube/NeverwinterDP

cd NeverwinterDP-Commons
gradle clean build install -x test

cd ../Queuengin
gradle clean build install -x test

cd ../Sparkngin
gradle clean build install -x test

cd ../Scribengin
gradle clean build install -x test

cd ../Demandspike
gradle clean build install -x test

cd ../NeverwinterDP
gradle clean build install release -x test

cd ../../../../../../


rm -rf Vagrantfile
vagrant plugin install vagrant-flow
vagrant flow multiinit
vagrant up --provider=digital_ocean
vagrant flow ansibleinventory
vagrant flow hostfile -d
vagrant flow playbook
