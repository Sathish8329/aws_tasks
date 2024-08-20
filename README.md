# aws_tasks

create a ebs volume
select the required volume size
select the avalibility zone same as the instance root volume availbility zone.
give a tag with meaniningful name always.

select the volumeID once created and attach the volume the instance.
ssh to the instance
apt update
run the commands fdisk -l - this will list all the disk size - you can find the root disk and how its partitioned

now the newly attached disk which will not be partiotioned we neeed to partition it - the newly disk will look like /dev/xvdf
fdisk /dev/xvdf - you will be asked to fill few details
m - is for help
n - to create a new partition
p - select p 
1 - partition number
then hit just enter for the entire volume size to attach the disk or you can give like +7G and give enter
w - to write at last, now it will be created 

fdisk -l - now you will see the partition
____________
mkfs tab 2 times
root@ip-172-31-6-174:~/matomo# mkfs
mkfs         mkfs.bfs     mkfs.btrfs   mkfs.cramfs  mkfs.ext2    mkfs.ext3    mkfs.ext4    mkfs.fat     mkfs.minix   mkfs.msdos   mkfs.ntfs    mkfs.vfat    mkfs.xfs

mkfs.ext4 and mkfs.xfs are used
you can use either one of these

root@ip-172-31-6-174:~/matomo# mkfs.ext4 /dev/xvdf1
mke2fs 1.47.0 (5-Feb-2023)
Creating filesystem with 2621184 4k blocks and 655360 inodes
Filesystem UUID: b90b35cd-1823-456a-8364-f0e404bcea8a
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632

Allocating group tables: done
Writing inode tables: done
Creating journal (16384 blocks): done
Writing superblocks and filesystem accounting information: done
formatting is done till now.

now to mount it
before mounting always take a backup 
I want to mount now matomo folder
so I have created a directory 
mkdir /tmp/matomo-backup
mv matomo/* /tmp/matomo-backup
first temporary mount 
mount /dev/xvdf1 /root/matomo/matomo/  #the disk name followed the folder along with relative path and hit enter
we have mounted it, you can use the command df -h to see it
since its a temporary mount I want it do it permanently, Im unmounting
umount /dev/xvdf1 /root/matomo/matomo/

For permanent mount
vi /etc/fstab
LABEL=cloudimg-rootfs   /        ext4   discard,commit=30,errors=remount-ro     0 1
LABEL=BOOT      /boot   ext4    defaults        0 2
LABEL=UEFI      /boot/efi       vfat    umask=0077      0 1
#This is the thing I have added
/dev/xdf1       /root/matomo/matomo     ext4    defaults 0 0
#the diskname   path of mount           extention type defaults 0 0
save and quit :wq
mount -a # this command will mount as per fstab instructions
you can now  check using df -h
---------



