variable "amis" {
  type = "map"
  default = {
    eu-west-1 = "ami-08660f1c6fb6b01e7"
    us-east-2 = "ami-0e7589a8422e3270f"
  }
}

variable "script_type" {
 default = "frontend"
}

variable "enviro" {
  default = "stage"
}

variable "private_key" {
  default = "/home/ubuntu/tacos"
}

variable "region" {
  default = "eu-west-1"
}

variable "total_instances"{
  type="map"
  default = {
    stage = 1
    prod = 2
  }
}

variable "remote_command"{
  type = "map"
  default = {
    frontend = [
      "sudo apt-get update",
      "sudo apt-get install -y python"
    ]
    backend = [
      "sudo apt-get update",
      "sudo apt-get install -y tomcat8 tomcat8-docs tomcat8-admin tomcat8-examples"
    ]
  }
}


