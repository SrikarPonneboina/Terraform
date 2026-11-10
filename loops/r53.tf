resource "aws_route53_record" "roboshop" {
  count = length(var.instances)
  zone_id = var.hostedzone_id
  name    = "${var.instances[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop-instances[count.index].private_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "frontend" {
  count = contains(var.instances, "frontend") ? 1 : 0   
  #from instances list if it contains frontend then create 1 record or else 0 records
  #Count = contains(["mongodb","redis","mysql","rabbitmq","catalogue","user","cart","shipping","payment","frontend"], "frontend") ? Creates 1 record (true): else 0 record(false)
  #condition ? true_value : false_value
  #count = 1 → 1 record/resource is created
  zone_id = var.hostedzone_id
  name    = "${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop-instances[index(var.instances, "frontend")].public_ip]   #from index we are checking in the list instances if we found frontend 
  #how to check element index in a list terraform
  #this is how it looks like below
  #index(["mongodb","redis","mysql","rabbitmq","catalogue","user","cart","shipping","payment","frontend"], "frontend")
  allow_overwrite = true
}
