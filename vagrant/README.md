# Vagrant

The folder contains a Vagrantfile and a provisioning shell script to create a
virtual machine (VagrantBox) to get started with fm-ProductNode release 2.3.

The scripts might also be helpful as a reference if there are questions or problems arising during the manual installation of fm-ProductNode.

## Content of the virtual machine
- Box with 8 GB RAM
- ubuntu/xenial64 operating system
- PHP 7.0 CLI with appropriate php.ini configuration settings
- ioncube Loader for Linux x86-64
- fm-ProductNode application located in the directory */home/ubuntu/fm-productnode*

Note: The virtual machine has been created with an older
[Vagrant](https://www.vagrantup.com/) version (1.8) and
[VirtualBox](https://www.virtualbox.org/) version (4.3)...

## Usage

1. vagrant up
2. vagrant ssh
3. cd fm-productnode
4. Execute fm-ProductNode commands, e. g.
```
   php trans catalog.read <path_to_product_catalog>/MyBMEcatDocument.xml
```
5. exit
6. vagrant suspend
