resource "aws_instance" "hosty-ec2" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # VPC subnet
  subnet_id = "${aws_subnet.hosty-pub-1a.id}"

  # security group
  vpc_security_group_ids = ["${aws_security_group.hosty-instance.id}"]

  # public SSH key
  key_name = "${aws_key_pair.hosty-key.key_name}"
}
