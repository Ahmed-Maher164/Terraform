resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  parameter_group_name = "default.mysql5.7"
  username             = "admin"
  password             = "admin123"
  port                 = "3306"
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name = aws_db_subnet_group.my_db_rds.name 
}

resource "aws_db_subnet_group" "my_db_rds" {
  name = "rds-main"
  subnet_ids = [ module.iti.private1_id,  module.iti.private2_id]
}