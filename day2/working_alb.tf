resource "aws_lb" "ashu-app-lb1" {
  name = "ashu-app-lb"
  internal = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ashu-allow_tls.id] # existing sec
  subnets            = ["subnet-0ffbfed9bbfa3b0ee","subnet-09d3a6a43989df57c"]

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
    type = "forward"
    target_group_arn = aws_lb_target_group.ashu-tg-group.arn     
  }
}

# register target group  
resource "aws_lb_target_group_attachment" "ashu-attach" {
  count = length(aws_instance.rp-vm1.*.id)
  target_group_arn = aws_lb_target_group.ashu-tg-group.arn
  target_id        = aws_instance.rp-vm1[count.index].id 
  port             = 80
}
