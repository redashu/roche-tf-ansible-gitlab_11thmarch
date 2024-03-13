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

### to make password less connection b/w ansible and target host use key based 

```
ashu@ip-172-31-18-146 ashu-ansible]$ ssh-keygen 
Generating public/private rsa key pair.
Enter file in which to save the key (/home/ashu/.ssh/id_rsa): 
/home/ashu/.ssh/id_rsa already exists.
Overwrite (y/n)? y
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/ashu/.ssh/id_rsa.
Your public key has been saved in /home/ashu/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:g84m4lUNjXJSJ+pSfuitgOnRb33AEjhSV6ASYs3W2A0 ashu@ip-172-31-18-146.ec2.internal
The key's randomart image is:
+---[RSA 2048]----+
|.oo +EB..        |
|o .*.* *         |
| .o.B + .        |
| ..* * +         |
|  o = * S        |
| o.o B o .       |
|o.o.+ B .        |
```

### transfer 

```
ssh-copy-id   test@192.168.1.10
```

### history 

```
  ansible  -i  hosts ashu-nodes  -u test -k  -m ping 
  440  ssh-keygen 
  441  ssh-copy-id   test@192.168.1.10
  442  ssh  test@192.168.1.10 
  443  ansible  -i  hosts ashu-nodes  -u test  -m ping 
```


