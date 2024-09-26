resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  vpc_zone_identifier  = [aws_subnet.subnet1.id]
  launch_template {
    id      = aws_launch_template.web_template.id
    version = "$$Latest"
  }
}
