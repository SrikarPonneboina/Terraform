resource "aws_route53_record" "roboshop" {
  count = 10
  zone_id = var.hostedzone_id
  name    = "${var.instances[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop-instances[count.index].private_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "frontend" {
  count = 1
  zone_id = var.hostedzone_id
  name    = "${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop-instances[count.index].public_ip]
  allow_overwrite = true
}