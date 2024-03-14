## Revision 

<img src="rev.png">

### ansible config file loading order 

<img src="order.png">

### tree of ansible 

```
[ashu@ip-172-31-18-146 ashu-ansible]$ tree
.
├── ansible.cfg
├── devhost
├── docker-compose.yaml
├── group_vars
│   ├── common
│   ├── db
│   └── web
├── hosts
├── host_vars
│   ├── 192.168.1.10
│   └── 192.168.1.11
├── playbooks
│   ├── ashu-grpvar.yaml
│   ├── db.yml
│   ├── install_soft.yaml
│   ├── test.yaml
│   └── update-method.yml
├── variables
│   ├── myvar1.yml
│   └── test_var.yml
└── webapp
    ├── ashu.html
    └── db.sql
```

### project ansible directory structure 

```
ashu@ip-172-31-18-146 poc]$ pwd
/home/ashu/poc
[ashu@ip-172-31-18-146 poc]$ mkdir  ashu-project 
[ashu@ip-172-31-18-146 poc]$ cd  ashu-project/
[ashu@ip-172-31-18-146 ashu-project]$ mkdir  playbooks host_vars group_vars variables inventories roles 
[ashu@ip-172-31-18-146 ashu-project]$ tree 
.
├── group_vars
├── host_vars
├── inventories
├── playbooks
├── roles
└── variables

6 directories, 0 files
[ashu@ip-172-31-18-146 ashu-project]$ touch  ansible.cfg 
[ashu@ip-172-31-18-146 ashu-project]$ tree 
.
├── ansible.cfg
├── group_vars
├── host_vars
├── inventories
├── playbooks
├── roles
└── variables

6 directories, 1 file
[ashu@ip-172-31-18-146 ashu-project]$ 
```

### loop in ansible 

<img src="loop.png">

### facts in ansible 

```
[ashu@ip-172-31-18-146 ashu-project]$ 
[ashu@ip-172-31-18-146 ashu-project]$ ansible   localhost  -m setup   | grep -i hostname
            "HOSTNAME": "ip-172-31-18-146.ec2.internal", 
        "ansible_hostname": "ip-172-31-18-146", 
[ashu@ip-172-31-18-146 ashu-project]$ 
[ashu@ip-172-31-18-146 ashu-project]$ ansible  192.168.1.12  -m setup   | grep -i hostname
        "ansible_hostname": "ashunode3", 
                "mount": "/etc/hostname", 
[ashu@ip-172-31-18-146 ashu-project]$ ansible  patch  -m setup   | grep -i hostname
        "ansible_hostname": "ashunode3", 
                "mount": "/etc/hostname", 
        "ansible_hostname": "ashunode1", 
                "mount": "/etc/hostname", 
        "ansible_hostname": "ashunode2", 
                "mount": "/etc/hostname", 
[ashu@ip-172-31-18-146 ashu-project]$ 


```

### db-server playbook

```
---
- hosts: patch
  become: true 
  tasks:
  - name: Installing java in all the system 
    yum:
      name: "{{ javaupdates }}"
      state: present 

  - name: create multiple users in patch group hosts 
    user: 
      name: "{{ item }}"
      state: present
    loop: "{{ usernames }}" # for -- > with_items -- loop

  - name: installing db software
    yum:
      name: "{{ dbsoft }}" 
      state: present
    when: ansible_hostname  == 'ashunode3'

  - name: starting mariadb service 
    service:
      name: mariadb
      state: started
      enabled: yes
    when: ansible_hostname  == 'ashunode3'  
```

### checking syntax always 

```
ansible-playbook  playbooks/dbset-up.yaml --syntax-check 

playbook: playbooks/dbset-up.yaml
[ashu@ip-172-31-18-146 ashu-project]$ 


```


