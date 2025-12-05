#! /bin/bash
# Launch an instance with port 9000 and t2.medium

cd /opt/ || exit

# Download SonarQube
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.6.50800.zip

# Unzip SonarQube automatically
unzip -o sonarqube-8.9.6.50800.zip

# Install Java 11 (Amazon Corretto)
sudo dnf install -y java-11-amazon-corretto-devel

# Create sonar user with home directory if it doesn't exist
if ! id sonar >/dev/null 2>&1; then
    sudo useradd -m sonar
fi

# Set ownership and permissions
sudo chown -R sonar:sonar sonarqube-8.9.6.50800
sudo chmod -R 755 sonarqube-8.9.6.50800

# Switch to sonar user interactively
su - sonar


#run this on server manually
#cd /opt/sonarqube-8.9.6.50800/bin/linux-x86-64
#./sonar.sh start
#./sonar.sh status

#echo "user=admin & password=admin"
