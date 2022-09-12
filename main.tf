resource "aws_launch_template" "eks-lt" {
  name = var.lt_name

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = var.disksize
    }
  }

  ebs_optimized = true

  iam_instance_profile {
    name = var.iam_instance_profile
  }

  image_id = var.ami_id

  key_name = var.keypair_name


  monitoring {
    enabled = true
  }

  vpc_security_group_ids = ["sg-04524276ec9ed9fe9", "sg-0a02e6b655453c676"]

  user_data = "${filebase64("init.sh")}"
}