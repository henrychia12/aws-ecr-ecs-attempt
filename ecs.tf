resource "aws_ecs_cluster" "project-cluster" {
    name = "project-cluster"
}
resource "aws_launch_configuration" "ecs-project-launchconfig" {
    name_prefix          = "ecs-launchconfig"
    image_id             = "${lookup(var.ECS_AMIS, var.AWS_REGION)}"
    instance_type        = "${var.ECS_INSTANCE_TYPE}"
    key_name             = "${aws_key_pair.mykeypair.key_name}"
    iam_instance_profile = "${aws_iam_instance_profile.ecs-ec2-role.id}"
    security_groups      = ["${aws_security_group.ecs-securitygroup.id}"]
    user_data            = "#!/bin/bash\necho 'ECS_CLUSTER=project-cluster' > /etc/ecs/ecs.config\nstart ecs"
    lifecycle		   {create_before_destroy = true}
}
resource "aws_autoscaling_group" "ecs-project-autoscaling" {
    name                 = "ecs-project-autoscaling"
    vpc_zone_identifier  = ["${aws_subnet.main-public-1.id}", "${aws_subnet.main-public-2.id}"]
    launch_configuration = "${aws_launch_configuration.ecs-project-launchconfig.name}"
    min_size             = 1
    max_size		 = 1
    tag {
	key = "Name"
	value = "ecs-ec2-container"
	propagate_at_launch = true
    }
}
