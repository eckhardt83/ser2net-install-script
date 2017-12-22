sudo apt update && sudo apt upgrade -y
sudo apt install policykit-1 -y
sudo apt install ser2net -y
sudo cp /etc/ser2net.conf /etc/ser2net.conf.old
sudo touch /etc/systemd/system/ser2net.service
sudo echo "
[Unit]
Description=ser2net
After=syslog.target

[Service]
Type=forking
ExecStart=/usr/sbin/ser2net

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/ser2net.service
sudo systemctl daemon-reload
sudo systemctl enable ser2net.service
sudo systemctl start ser2net.service

sudo echo "
BANNER:0: Terminal Server TCP port A.0
BANNER:1: Terminal Server TCP port A.1
BANNER:2: Terminal Server TCP port A.2
BANNER:3: Terminal Server TCP port A.3
BANNER:4: Terminal Server TCP port B.4
BANNER:5: Terminal Server TCP port B.5
BANNER:6: Terminal Server TCP port B.6
BANNER:7: Terminal Server TCP port B.7

4000:telnet:0:/dev/ttyUSB0:9600 8DATABITS NONE 1STOPBIT 0
4001:telnet:0:/dev/ttyUSB1:9600 8DATABITS NONE 1STOPBIT 1
4002:telnet:0:/dev/ttyUSB2:9600 8DATABITS NONE 1STOPBIT 2
4003:telnet:0:/dev/ttyUSB3:9600 8DATABITS NONE 1STOPBIT 3
4004:telnet:0:/dev/ttyUSB0:9600 8DATABITS NONE 1STOPBIT 4
4005:telnet:0:/dev/ttyUSB1:9600 8DATABITS NONE 1STOPBIT 5
4006:telnet:0:/dev/ttyUSB2:9600 8DATABITS NONE 1STOPBIT 6
4007:telnet:0:/dev/ttyUSB3:9600 8DATABITS NONE 1STOPBIT 7 " > /etc/ser2net.conf 
echo " Please Reboot !!"