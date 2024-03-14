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
