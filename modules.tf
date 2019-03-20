variable "environment" {
  default = "stage"
}

variable "key" {
  default = "/home/ubuntu/tacos"
}

module "frontend"{
  source = "./aws_instances"
  script_type = "frontend"
  enviro = "${var.environment}"
  private_key = "${var.key}"
}

module "backend"{
  source = "./aws_instances"
  region = "us-east-2"
  script_type = "backend"
  enviro = "${var.environment}"
  private_key = "${var.key}"
}

output "front_end_ips"{
  value="${module.frontend.ips}"
}

output "back_end_ips"{
  value="${module.backend.ips}"
}
