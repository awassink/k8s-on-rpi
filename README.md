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

For each SD-card, modify the occidentalis.txt file on the boot volume to a useful hostname, ie rpi-master, rpi-node-01 etc.


######Installing the master node
Boot a Raspi from the rpi-master SD-card, login through ssh (ssh root@rpi-master OR ssh root@<rpi-master ip address>) with the password 'hypriot' and execute the following:
```
git clone https://github.com/juulsme/k8s-on-rpi
cd k8s-on-rpi/
git checkout k8s-1.2
./install-k8s-master.sh
```


######Installing the worker nodes
Boot a Raspi from an rpi-node-xx SD-card, login through ssh (ssh root@rpi-master OR ssh root@<rpi-master ip address>) with the password 'hypriot' and execute the following:
```
git clone https://github.com/juulsme/k8s-on-rpi
cd k8s-on-rpi/
git checkout k8s-1.2
./install-k8s-worker.sh
```
When the nano-editor pops-up, change the rpi-master reference either to the master node's hostname (ie rpi-master) or the master node's IP-address.
