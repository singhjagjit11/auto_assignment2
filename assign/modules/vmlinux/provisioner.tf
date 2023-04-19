resource "null_resource" "hostname" {
  provisioner "local-exec" {
    command = "echo `hostnamectl`"
  }
}

