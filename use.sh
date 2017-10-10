echo "Welcome! I will try and sort all of the NFS out for the flo server! <3"
sleep 2

echo "Checking the APT repo's"
sleep 2
    sudo apt-get update -y
    sudo apt-get install nfs-kernel-server -y
    sudo apt-get install nfs-common -y
echo "Setup of APT done!"
sleep 5

echo "Create the maps folder and setup the mountpoint!"
    mkdir -p /mnt/maps
    mount 10.50.0.104:/fs-data/pool/maps /mnt/maps/
echo "Completed (Hopefully you didnt see any errors from that!"
sleep 2

echo "Adding the NFS share to Fstab!"
    echo "10.50.0.104:/fs-data/pool/maps    /mnt/maps   nfs   rsize=8192,wsize=8192,timeo=14,intr" >> /etc/fstab
sleep 1
echo "Done"

echo "Copy over the Daemon changes to allow Flo to do its magic <3"
    cp /mnt/maps/Docker-Edits/docker.js /srv/daemon/src/controllers/docker.js
sleep 1
echo "Done!"

echo "xD Thank you!"
