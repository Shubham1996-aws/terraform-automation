 resource "aws_db_instance" "myrds" {
   allocated_storage   = 20
   storage_type        = "gp2"
   identifier          = "rdstf1"
   engine              = "mysql"
   engine_version      = "8.0.27"
   instance_class      = "db.t2.micro"
   username            = "admin"
   password            = "admin123"
   publicly_accessible = true
   skip_final_snapshot = true

   tags = {
     Name = "myrds"
   }
 }