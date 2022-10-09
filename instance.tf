resource "aws_instance" "web-server" {
    ami = "ami-026b57f3c383c2eec"
    instance_type = "t2.micro"
    count = 2
    key_name = "Deepakshi"
    security_groups = [aws_security_group.web-sg.name]
    user_data = "${file("userdata.sh")}"
    tags = {
      "Name" = "web-${count.index}"
    }
  
} 