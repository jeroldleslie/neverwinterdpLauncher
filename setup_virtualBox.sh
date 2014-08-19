set -x
rm -rf ./DemandCubePlaybooks
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
gradle clean build install

cd ../Queuengin
gradle clean build install

cd ../Sparkngin
gradle clean build install

cd ../Scribengin
gradle clean build install

cd ../Demandspike
gradle clean build install

cd ../NeverwinterDP
gradle clean build install release

cd ../../../../../../


rm -rf Vagrantfile
vagrant plugin install vagrant-flow
vagrant flow multiinit
vagrant up --provider=virtualbox
vagrant flow ansibleinventory
vagrant flow hostfile
vagrant flow playbook
