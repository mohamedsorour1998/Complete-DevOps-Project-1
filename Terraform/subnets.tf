resource "aws_subnet" "private" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.main.id
  availability_zone = "us-east-1b"

  tags = {
    Name = "private_subnet"
  }
}

resource "aws_subnet" "public" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = aws_vpc.main.id
  availability_zone = "us-east-1b"

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "public_a_subnet"
  }
}


