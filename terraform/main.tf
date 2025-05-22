terraform {
  required_version = ">= 0.12.26"
  aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
}

variable "subject" {
   type = string
   default = "tfctl-rc"
   description = "Subject to hello"
}

output "hello_world" {
  value = "hey hey ya, ${var.subject}!"
}


variable "subject01" {
   type = string
   default = "World"
   description = "Subject to hello"
}

resource "random_id" "id" {
  keepers = {
    trigger = var.subject01
  }

  byte_length = 4
}

output "new_world" {
  value = "Hello World, ${var.subject01} ${random_id.id.hex}!"
}
