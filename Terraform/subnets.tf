resource "aws_subnet" "private" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.main.id

  tags = {
    Name = "private_subnet"
  }
}

resource "aws_subnet" "public" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = aws_vpc.main.id

  tags = {
    Name = "public_subnet"
  }
}