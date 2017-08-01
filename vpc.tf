## Internet VPC
resource "aws_vpc" "hosty-vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"

  tags {
    Name = "hostyVPC"
  }
}

## Subnets
resource "aws_subnet" "hosty-pub-1a" {
  vpc_id = "${aws_vpc.hosty-vpc.id}"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-west-1a"

  tags {
    Name = "hosty-pub-1a"
  }
}

resource "aws_subnet" "hosty-pub-1b" {
  vpc_id = "${aws_vpc.hosty-vpc.id}"
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-west-1b"

  tags {
    Name = "hosty-pub-1b"
  }
}

resource "aws_subnet" "hosty-pub-1c" {
  vpc_id = "${aws_vpc.hosty-vpc.id}"
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-west-1c"

  tags {
    Name = "hosty-pub-1c"
  }
}

resource "aws_subnet" "hosty-priv-1a" {
  vpc_id = "${aws_vpc.hosty-vpc.id}"
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-west-1a"

  tags {
    Name = "hosty-priv-1a"
  }
}

resource "aws_subnet" "hosty-priv-1b" {
  vpc_id = "${aws_vpc.hosty-vpc.id}"
  cidr_block = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-west-1b"

  tags {
    Name = "hosty-priv-1b"
  }
}

resource "aws_subnet" "hosty-priv-1c" {
  vpc_id = "${aws_vpc.hosty-vpc.id}"
  cidr_block = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-west-1c"

  tags {
    Name = "hosty-priv-1c"
  }
}

## Internet Gateway
resource "aws_internet_gateway" "hosty-gw" {
  vpc_id = "${aws_vpc.hosty-vpc.id}"

  tags {
    Name = "hostyGW"
  }
}

## route tables
resource "aws_route_table" "hosty-pub" {
  vpc_id = "${aws_vpc.hosty-vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.hosty-gw.id}"
  }

  tags {
    Name = "hosty-pub-1a"
  }
}

## route associations public
resource "aws_route_table_association" "hosty-pub-1a-association" {
  subnet_id = "${aws_subnet.hosty-pub-1a.id}"
  route_table_id = "${aws_route_table.hosty-pub.id}"
}

resource "aws_route_table_association" "hosty-pub-1b-association" {
  subnet_id = "${aws_subnet.hosty-pub-1b.id}"
  route_table_id = "${aws_route_table.hosty-pub.id}"
}

resource "aws_route_table_association" "hosty-pub-1c-association" {
  subnet_id = "${aws_subnet.hosty-pub-1c.id}"
  route_table_id = "${aws_route_table.hosty-pub.id}"
}
