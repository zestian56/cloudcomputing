#!/bin/bash
sudo -i
sudo apt-get install vim -y
sudo apt-get install net-tools -y
echo "Installing python3-pip"
sudo apt install python3-pip -y
echo "Instaling jupyter"
pip3 install jupyter
echo "Creating Jupyter service"
cat <<END> /usr/lib/systemd/system/jupyter.service
[Unit]
Description=Jupyter Notebook
[Service]
Type=simple
PIDFile=/run/jupyter.pid
ExecStart=/usr/local/bin/jupyter-notebook --ip=0.0.0.0 --no-browser
User=vagrant
Group=vagrant
WorkingDirectory=/vagrant
Restart=always
RestartSec=10
#KillMode=mixed
[Install]
WantedBy=multi-user.target
END
echo "Starting Jupyter service"
sudo systemctl enable jupyter.service
sudo systemctl daemon-reload
sudo systemctl restart jupyter.service
echo "END"