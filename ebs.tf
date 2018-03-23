/*
 * EBS configuration
 */

resource "aws_ebs_volume" "volume" {
  count = "${var.iops == 0 ? var.volumes_per_az * length(var.availability_zones) : 0}"
  availability_zone = "${var.availability_zones[count.index % length(var.availability_zones)]}"
  type = "${var.type}"
  size = "${var.size}"
  tags   = "${merge(var.common_tags, map("Name",format("%s-%s-%s-%02d",var.environment, var.app_name, var.role, count.index+1)))}"
  encrypted = true
  kms_key_id = "${var.kms_key_arn}"
}

resource "aws_ebs_volume" "iops-volume" {
  count = "${var.iops > 0 ? var.volumes_per_az * length(var.availability_zones) : 0}"
  availability_zone = "${var.availability_zones[count.index % length(var.availability_zones)]}"
  type = "io1"
  size = "${var.size}"
  iops = "${var.iops}"
  tags   = "${merge(var.common_tags, map("Name",format("%s-%s-%s-%02d",var.environment, var.app_name, var.role, count.index+1)))}"
  encrypted = true
  kms_key_id = "${var.kms_key_arn}"
}
