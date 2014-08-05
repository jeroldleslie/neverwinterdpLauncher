set -x
git clone https://github.com/DemandCube/DemandCubePlaybooks.git 
cd DemandCubePlaybooks
git clone https://github.com/DemandCube/ansible-flow.git
mv -f  ./ansible-flow/library/ ./library
rm -rf ./ansible-flow

cd ../
rm -rf Vagrantfile
vagrant plugin install vagrant-flow
vagrant flow multiinit
vagrant up --provider=digital_ocean
vagrant flow ansibleinventory
vagrant flow hostfile -d
vagrant flow playbook
