resource "aws_db_subnet_group" "hosty-mariadb-sub" {
  name = "hosty-mariadb-sub"
  description = "RDS subnet group"
  subnet_ids = ["${aws_subnet.hosty-priv-1a.id}","${aws_subnet.hosty-priv-1b.id}"]
}

resource "aws_db_parameter_group" "hosty-mariadb-pg" {
  name = "hosty-mariadb-pg"
  family = "mariadb10.1"
  description = "MariaDB parameter group"

  parameter {
    name = "max_allowed_packet"
    value = "167777216"
  }
}

resource "aws_db_instance" "hosty-mariadb-instance" {
  allocated_storage = 100   # 100GB of storage, gives us more IOPS than a lower number
  engine = "mariadb"
  engine_version = "10.1.14"
  instance_class = "db.t2.small"  # use micro if you want to use the free tier
  identifier = "mariadb"
  name = "mariadb"
  username = "root"   # username
  password = "${var.RDS_PASSWORD}"  # password
  db_subnet_group_name = "${aws_db_subnet_group.hosty-mariadb-sub.name}"
  parameter_group_name = "hsoty-mariadb-pg"
  multi_az = "false"  # set to true to have high availability: 2 instances synchronized with each other
  vpc_security_group_ids = ["${aws_security_group.hosty-allow-mariadb.id}"]
  storage_type = "gp2"
  backup_retention_period = 30    # how long you're going to keep your backups
  availability_zone = "${aws_subnet.hosty-priv-1a.availability_zone}"  # prefered AZ

  tags {
    Name = "hosty-mariadb-instance"
  }
}
