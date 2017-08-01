resource "aws_security_group" "hosty-instance" {
  vpc_id = "${aws_vpc.hosty-vpc.id}"
  name = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

tags {
  Name = "hosty-instance"
  }
}

resource "aws_security_group" "hosty-allow-mariadb" {
  vpc_id = "{aws_vpc.hosty-vpc.id}"
  name = "allow-mariadb"
  description = "allow-mariadb"

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = ["${aws_security_group.hosty-instance.id}"]    # allowing access from our hosty instance
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self = true
  }

tags {
  Name = "hosty-allow-mariadb"
  }
}
