# install docker 
curl -sSL https://get.daocloud.io/docker | sh
sudo usermod -aG docker ubuntu

# partition and format and mount disk to data 
fdisk /dev/vdb
n
p
1


w

mkfs /dev/vdb1

mount /dev/vdb1 /data

edit /etc/rc.local that appending mount /dev/vdb1/data 


# change the system variable  and mkdir 
source source.sh

# start docker 

./start_docker.sh
