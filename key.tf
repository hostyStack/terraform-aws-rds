resource "aws_key_pair" "hosty-key" {
  key_name = "hosty-ireland-key"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
