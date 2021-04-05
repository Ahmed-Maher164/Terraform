resource "aws_internet_gateway" "iti" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "iti"
  }
}