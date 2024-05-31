## Ping pong exercise

In this folder you will find several files containing the necessary configuration to set up a "ping pong" of sort between two VM's brought to life with Vagrant

### Required packages

To ensure everything runs smoothly as we would like it to, we are going to need several packages:

`Vagrant` - Will enable us to quickstart our two required VM's


`Ansible` - Will automate the whole process by the usage of its playbook


`sshpass` - Will allow us to circumvent some issues that may arise with ssh key authentication

Everything else will be neatly taken care of by our Vagrant and Ansible setup

### Quick startup

To kickstart our project, we are going to need several files:

`Vagrantfile` - Will download and bring to life our virtual machines, and link our Ansible files to them with the provisioning

`Playbook.yml` - The Ansible playbook will automate all the necessary installation and container configuration settings

`ansible.cfg` - Provides basic Ansible configuration

`inventario` - The inventory file (Which will go with the italian translation in my case) will make Ansible privy to which hosts it should target

All the files are to be located in the same directory, once you're in it, you can proceed with the following command:

`vagrant up`

And you're done, all you are meant to do afterwards is check if the ping pong is actually in execution:

`vagrant ssh node1 -c "watch sudo docker ps -a"`


`vagrant ssh node1 -c "watch sudo docker ps -a"`

Should everything be in order, you will find that the containers on the two nodes are interchangebly being turned off and on every minute





















