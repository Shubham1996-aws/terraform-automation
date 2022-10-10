# target group creation
resource "aws_lb_target_group" "target-group" {
    health_check {
      interval = 10
      path = "/maven-web-aplication/"
      protocol = "HTTP"
      timeout = 5
      healthy_threshold  = 3
      unhealthy_threshold = 2
    }
    name = "albtg2"
    port = 8080
    protocol = "HTTP"
    target_type = "instance"
    vpc_id = data.aws_vpc.default-vpc.id
  
}

# creating alb
resource "aws_lb" "application-load-balancer" {
    name = "application-load-balancer"
    internal = false
    ip_address_type = "ipv4"
    load_balancer_type = "application"
    security_groups = [aws_security_group.web-sg.id ]
    subnets = data.aws_subnet_ids.subnet.ids
     tags = {
       "Name" = "alb"
     }
}
# listener creation
resource "aws_lb_listener" "alb_listener" {
    load_balancer_arn = aws_lb.application-load-balancer.arn
    port = 8080
    protocol = "HTTP"
    default_action {
      target_group_arn = aws_lb_target_group.target-group.arn
      type = "forward"
    }
}
# attachment

resource "aws_lb_target_group_attachment" "alb-attach" {
    count = length(aws_instance.web-server)
    target_group_arn = aws_lb_target_group.target-group.arn
    target_id = aws_instance.web-server[0].id 
  
}

#dns output
output "alb_dns1" {
    value = aws_lb.application-load-balancer.dns_name
  
}
