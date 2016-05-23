<!---
 Copyright 2015 Arjen Wassink

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
--->

Kubernetes on Raspberry PI
==========================
Flash hypriot-rpi-20151115-132854.img on to micro SD-cards for the Raspi's. See http://blog.hypriot.com/getting-started-with-docker-on-your-arm-device/ for instructions and http://blog.hypriot.com/downloads/ for the image.

For each SD-card, modify the hostname entry in the occidentalis.txt file on the boot volume to something more useful than "black-pearl", for example rpi-master, rpi-node-01 etc.

Before actually attempting to install the nodes, please make sure your Raspi is connected to the internet.
This is also necessary in order for the cluster to work, since the flannel service fails to start if it cannot reach an NTP server.
So to summarize: be online.


######Installing the master node
Boot a Raspi from the rpi-master SD-card, login through ssh (ssh root@rpi-master OR ssh root@master-node's-ip) with the password 'hypriot' and execute the following:
```
git clone https://github.com/juulsme/k8s-on-rpi
cd k8s-on-rpi/
git checkout k8s-1.2
./install-k8s-master.sh
```


######Installing the worker nodes
Boot a Raspi from an rpi-node-xx SD-card, login through ssh (ssh root@rpi-master OR ssh root@master-node's-ip) with the password 'hypriot' and execute the commands listed below.
When the nano-editor pops-up, change the rpi-master reference either to the master node's hostname (ie rpi-master) or the master node's IP-address.
```
git clone https://github.com/juulsme/k8s-on-rpi
cd k8s-on-rpi/
git checkout k8s-1.2
./install-k8s-worker.sh
```
After the script completes, please reboot the worker, with the master node up and running. If everything is ok,
you should be able to run `kubectl get nodes --server=http://rpi-master:8080` and the newly installed worker should be visible and ready.