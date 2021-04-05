resource "tls_private_key" "generate_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = tls_private_key.generate_key.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.generate_key.private_key_pem
  filename = "private_key.pem"
}