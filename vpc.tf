data "aws_vpc" "default-vpc" {
    default = true
  
}
data "aws_subnet_ids" "subnet" {
  vpc_id = data.aws_vpc.default-vpc.id
}
