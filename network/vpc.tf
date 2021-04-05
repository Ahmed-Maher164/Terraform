resource "aws_vpc" "myvpc" { /// main here to declare my resource only for code not provider
  cidr_block = var.cidr
  tags = {
    Name = "iti"
  }
}