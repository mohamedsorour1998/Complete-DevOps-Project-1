resource "aws_key_pair" "ssh" {
  key_name   = "ssh"
  public_key = file("./ssh.pub")


  tags = {
    Name = "ssh"
  }
}


resource "aws_instance" "bastion" {
  ami                         = "ami-02396cdd13e9a1257" # Amazon Linux 3
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  key_name                    = aws_key_pair.ssh.key_name
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = true # Enable public IP address

  tags = {
    Name = "bastion"
  }

}
resource "aws_instance" "app" {
  ami                    = "ami-02396cdd13e9a1257" # Amazon Linux 3
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private.id
  key_name               = aws_key_pair.ssh.key_name
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tags = {
    Name = "app"
  }


}
