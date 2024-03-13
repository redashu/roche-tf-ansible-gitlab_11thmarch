### Revision 

<img src="rev.png">

### terraform can't do configuration management 

<img src="config.png">

### Introduction to Ansible platform -- ENTerprise -- AAP (ansible automation platform )

<img src="ansible.png">

### ansible more details 

<img src="ansible1.png">

### ansible architecture 

<img src="ansible2.png">

### installing in amazon linux / rhel / fedora / centos / rockylinux / OEL 

```
amazon-linux-extras  install ansible2 
```

### verify 

```
ashu@ip-172-31-18-146 ~]$ ansible --version 
ansible 2.9.23
  config file = /etc/ansible/ansible.cfg
  configured module search path = [u'/home/ashu/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python2.7/site-packages/ansible
  executable location = /usr/bin/ansible
  python version = 2.7.18 (default, Dec 18 2023, 22:08:43) [GCC 7.3.1 20180712 (Red Hat 7.3.1-17)]
[ashu@ip-172-31-18-146 ~]$ 

```

### ansible config directory 

<img src="config1.png">


### creating ansible inventory and config file 

### inventory 

```
# this is ansible inventroy file 
[ashu-nodes]
192.168.1.10



```

### ansible.cfg 

```
[defaults]
inventory      = ./hosts # location of inventory file 
remote_port    = 22 # target host ssh port 
sudo_user      = root # optional 
remote_user    =  test # use by ansible to connect target hosts 
```

