resource "aws_lb" "ashu-app-lb1" {
  name = "ashu-app-lb"
  internal = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ashu-allow_tls.id] # existing sec
  subnets            = var.ashu-availability_zones[count.index]

}

# creating target group 
resource "aws_lb_target_group" "ashu-tg-group" {
  name = "ashu-target-group"
  port = 80 
  protocol = "HTTP"
  vpc_id = data.aws_vpc.ashu-vpcnew.id 
  target_type = "instance"
}

# creating LB listner 
resource "aws_lb_listener" "ashu-front_end" {
  load_balancer_arn = aws_lb.ashu-app-lb1.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "80"
      protocol    = "HTTP"
      status_code = "200"
    }
  }
}

# register target group  
resource "aws_lb_target_group_attachment" "ashu-attach" {
  target_group_arn = aws_lb_target_group.ashu-tg-group.arn
  target_id        = aws_instance.rp-vm1[*].id
  port             = 80
}
