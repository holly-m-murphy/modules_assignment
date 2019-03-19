data "aws_availability_zones" "available"{}
data "terraform_remote_state" "connection"{
  backend="s3"
  config={
    bucket="${var.bucket}"
    key="${var.bucket-key}/state"
    region="${var.region}"
  }
}
resource "aws_instance" "instance" {
  count = "${var.total_instances}"
  ami = "${var.amis[var.region]}"
  instance_type = "t2.micro"
  availability_zone="${data.aws_availability_zones.available.names[count.index]}"
  lifecycle{
    create_before_destroy = true
  }
}


