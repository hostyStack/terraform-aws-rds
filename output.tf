output "instance" {
  value = "${aws_instance.hosty-ec2.public_ip}"
}

# Output endpoint (hostname:port) of the RDS instance
output "rds_instance_endpoint" {
    value = "${aws_db_instance.hosty-mariadb-instance.endpoint}"
}
