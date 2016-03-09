echo "Updating System..."
sudo apt-get update && sudo apt-get upgrade -y

echo "Adding Docker Repo"
sudo apt-get install apt-transport-https ca-certificates -y
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
--recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo touch /etc/apt/sources.list.d/docker.list
sudo echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' \
> /etc/apt/sources.list.d/docker.list

echo "Pre-Install Tasks..."
sudo apt-get update && sudo apt-cache policy docker-engine
sudo apt-get install apparmor linux-image-extra-$(uname -r) -y

echo "Installing Docker..."
sudo apt-get install docker-engine -y
echo "Running Post-Install Tasks"

#Ubuntu 15.04
#sudo systemctl enable docker
sudo usermod -aG docker vagrant
echo "Starting Docker Daemon..."
sudo /usr/bin/docker daemon -H tcp://0.0.0.0:2375 \
-H unix:///var/run/docker.sock \
> /dev/null &
