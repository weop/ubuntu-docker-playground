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


sudo usermod -aG docker vagrant
if [ -f "/etc/init.d/ddaemon" ]; then
  sudo rm /etc/init.d/ddaemon
  echo "Removed existing ddaemon..."
fi
sudo cp /home/vagrant/.ddaemon.sh /etc/init.d/ddaemon
sudo chown root:root /etc/init.d/ddaemon
sudo chmod 755 /etc/init.d/ddaemon
sudo touch /var/log/ddaemon.log
sudo update-rc.d ddaemon defaults > /dev/null &
sudo update-rc.d ddaemon enable > /dev/null &
echo "Rebooting Docker Host Daemon..."
