## Revision 

### Terraform more commands

### please read about  ---graph 

### state list and manage

```
ashu@ip-172-31-18-146 wc]$ terraform  state list 
data.aws_vpc.ashu-vpcnew
data.template_file.ashu-user_data
aws_instance.rp-vm1[0]
aws_instance.rp-vm1[1]
aws_key_pair.generated_key
aws_lb.ashu-app-lb1
aws_lb_listener.ashu-front_end
aws_lb_target_group.ashu-tg-group
aws_lb_target_group_attachment.ashu-attach[0]
aws_lb_target_group_attachment.ashu-attach[1]
aws_security_group.ashu-allow_tls
aws_vpc_security_group_egress_rule.ashu-allow_all_traffic_ipv4
aws_vpc_security_group_ingress_rule.ashu-allow_22
aws_vpc_security_group_ingress_rule.ashu-allow_80
local_file.ssh_key
tls_private_key.private_key
[ashu@ip-172-31-18-146 wc]$ terraform  destroy -target=aws_instance.rp-vm1[0]
data.template_file.ashu-user_data: Reading...
data.template_file.ashu-user_data: Read complete after 0s [id=c616cc186df812ce6adc607d3535c2f9b62de61fdff67d56690e7eed28d7cef8]
tls_private_key.private_key: Refreshing state... [id=1138d622856813be677de7b5c8ea4775827e66fb]
data.aws_vpc.ashu-vpcnew: Reading...
aws_key_pair.generated_key: Refreshing state... [id=ashu-keynew123]
data.aws_vpc.ashu-vpcnew: Read complete after 1s [id=vpc-0613e72a46c8cb335]
aws_security_group.ashu-allow_tls: Refreshing state... [id=sg-03d3494fcfe6128e3]
aws_instance.rp-vm1[0]: Refreshing state... [id=i-0b791a582c2a5c67c]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_instance.rp-vm1[0] will be destroyed
  - resource "aws_instance" "rp-vm1" {
      - ami                                  = "ami-07761f3ae34c4478d" -> null
      - arn                                  = "arn:aws:ec2:us-east-1:751136288263:instance/i-0b791a582c2a5c67c" -> null
      - associate_public_ip_address          = true -> null
      - availability_zone                    = "us-east-1b" -> null
      - cpu_core_count                       = 1 -> null
      - cpu_threads_per_core                 = 1 -> null
      - disable_api_stop                     = false -> null
      - disable_api_termination              = false -> null
      - ebs_optimized                        = false -> null
      - get_password_data                    = false -> null
```


### terraform all 

<img src="rev.png">


### ansible roles path setup

## ansible.cfg

```
[defaults]
remote_user = test 
# default inventory location 
inventory = ./hosts 
roles_path = /home/ashu/poc/ashu-project/roles
```

### creating role using ansible-galaxy

```
ashu@ip-172-31-18-146 ashu-project]$ ls
ansible.cfg  group_vars  hosts  host_vars  playbooks  roles  variables
[ashu@ip-172-31-18-146 ashu-project]$ pwd
/home/ashu/poc/ashu-project
[ashu@ip-172-31-18-146 ashu-project]$ cd  roles/
[ashu@ip-172-31-18-146 roles]$ ansible-galaxy init  ashu-webapp
- Role ashu-webapp was created successfully
[ashu@ip-172-31-18-146 roles]$ ls
ashu-webapp  db  webhost
[ashu@ip-172-31-18-146 roles]$ 

```


