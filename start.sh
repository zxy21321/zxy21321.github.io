sudo mkdir -p /mnt/disks/data
sudo mount -o discard,defaults /dev/sdb /mnt/disks/data
sudo chmod a+w /mnt/disks/data
sudo apt-get update
sudo apt-get upgrade -y
sudo git clone https://github.com/Chia-Network/chia-blockchain.git -b latest --recurse-submodules
cd chia-blockchain
sudo chmod +x ./install.sh
sudo sh install.sh
