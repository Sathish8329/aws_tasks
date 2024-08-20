
commands
sudo apt update
#shows all the disks
sudo fdisk -l
#the disk will be partitioned with few questions
sudo fdisk /dev/xvdf
You will be prompted with options. Use the following commands:
m: Display help.
n: Create a new partition.
p: Select a primary partition.
1: Choose partition number 1.
Enter: Accept the default values to use the entire disk size or specify a size (e.g., +7G).
w: Write changes and exit.

sudo fdisk -l
#this command will show all the extentions
#type mkfs and give tab 2 times
mkfs
#select the extension either ext4 or xfs, we have selected ext4 here
sudo mkfs.ext4 /dev/xvdf1
#creating directory and moving it
mkdir /tmp/matomo-backup
mv /root/matomo/* /tmp/matomo-backup/
#this is temporary mount command
sudo mount /dev/xvdf1 /root/matomo/
df -h
#command to unmounth
sudo umount /dev/xvdf1

######FOR PERMANENT MOUNT###
sudo vi /etc/fstab
/dev/xvdf1  /root/matomo/  ext4  defaults  0  0

sudo mount -a

df -h

