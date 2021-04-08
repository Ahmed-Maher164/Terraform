
resource "aws_instance" "bastion" {
  ami             = var.ami_ubuntu_region
  instance_type   = "t2.micro"
  subnet_id       = module.network.public1_id
  security_groups = [aws_security_group.allow_ssh.id]
  key_name        = aws_key_pair.deployer.key_name


  tags = {
    Name = "bastion"
  }

  provisioner "local-exec" {
    command = "echo Bastion ip is ${aws_instance.bastion.public_ip}"
  }

}



resource "aws_instance" "application" {
  ami             = var.ami_ubuntu_region
  instance_type   = "t2.micro"
  subnet_id       = module.network.private1_id
  security_groups = [aws_security_group.allow_ssh_tcp.id]
  key_name        = aws_key_pair.deployer.key_name


  tags = {
    Name = "application"
  }



  
}