terraform{
  backend "s3"{
    bucket="table2hmterraform"
    key="modules/state"
    region="eu-west-1"
  }
}

data "aws_availability_zones" "available"{}

resource "aws_instance" "instance" {
  count = "${var.total_instances[var.enviro]}"
  ami = "${var.amis[var.region]}"
  instance_type = "t2.micro"
  key_name = "ec2"
  tags = {
    Name = "biscotti"
  }
  availability_zone="${data.aws_availability_zones.available.names[count.index]}"
  lifecycle{
    create_before_destroy = true
  }
  provisioner "remote-exec"{
    inline = "${var.remote_command["frontend"]}"
    connection{
      type = "ssh"
      private_key = "${file(var.private_key)}"
      user = "ubuntu"
    }
  }
}


