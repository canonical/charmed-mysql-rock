# MySQL Server ROCK
This repository contains the packaging metadata for creating a ROCK of MySQL built from the official ubuntu MySQL package from the Ubuntu repository and further installs mysql-shell.  For more information on ROCKs, visit the [rockcraft Github](https://github.com/canonical/rockcraft). 

Built for use in the [MySQL k8s charm](https://github.com/canonical/mysql-k8s-operator).

## Building the ROCK
The steps outlined below are based on the assumption that you are building the ROCK with the latest LTS of Ubuntu.  If you are using another version of Ubuntu or another operating system, the process may be different.

### Clone Repository
```bash
git clone git@github.com:canonical/charmed-mysql-container.git
cd mongodb-rock
```
### Installing Prerequisites
```bash
sudo snap install rockcraft --edge
sudo snap install docker
sudo snap install lxd
sudo snap install skopeo --edge --devmode
```
### Configuring Prerequisites
```bash
sudo usermod -aG docker $USER 
sudo lxd init --auto
```
*_NOTE:_* You will need to open a new shell for the group change to take effect (i.e. `su - $USER`)
### Packing and Running the ROCK
```bash
rockcraft pack
sudo skopeo --insecure-policy copy oci-archive:mysql*.rock docker-daemon:<username>/mysql-server:<tag>
docker run --rm -it <username>/mysql-server:<tag>
```

## License
The MySQL Server ROCK is free software, distributed under the Apache
Software License, version 2.0. See
[LICENSE](https://github.com/canonical/charmed-mysql-container/blob/8.0-20.04/LICENSE)
