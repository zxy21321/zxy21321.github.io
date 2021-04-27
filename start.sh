sudo apt update && sudo apt install mdadm --no-install-recommends

lsblk

sudo mdadm --create /dev/md0 --level=0 --raid-devices=4 \
/dev/nvme0n1 /dev/nvme0n2 /dev/nvme0n3 /dev/nvme0n4

sudo mkfs.ext4 -F /dev/md0

sudo mkdir -p /mnt/disks/ssd-array

sudo mount /dev/md0 /mnt/disks/ssd-array

sudo chmod a+w /mnt/disks/ssd-array

sudo mkfs.ext4 -m 0 -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/sdb

sudo mkdir -p /mnt/disks/data

sudo mount -o discard,defaults /dev/sdb /mnt/disks/data

sudo chmod a+w /mnt/disks/data

sudo apt-get install python3.7-venv python3.7-distutils python3.7-dev git -y

sudo apt-get update
sudo apt-get upgrade -y

sudo git clone https://github.com/Chia-Network/chia-blockchain.git -b latest --recurse-submodules
cd chia-blockchain
sudo chmod +x ./install.sh
sudo sh install.sh