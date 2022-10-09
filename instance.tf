resource "aws_instance" "web-server" {
    ami = "ami-078296f82eb463377"
    instance_type = "t2.micro"
    count = 2
    key_name = "shubham"
    security_groups = [aws_security_group.web-sg.name]
    user_data = "${file("userdata.sh")}"
    tags = {
      "Name" = "web-${count.index}"
    }
  
} 
