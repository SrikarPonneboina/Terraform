# resource "aws_route53_record" "roboshop" {
#   for_each = var.instances #here it finds length of instances
#   zone_id = var.hostedzone_id
#   name    = "${each.key}.${var.domain_name}"
#   type    = "A"
#   ttl     = 1
#   #records = [aws_instance.roboshop-instances[count.index].private_ip]
#   records = [aws_instance.roboshop-instances[each.key].private_ip]
#   allow_overwrite = true
# }

# resource "aws_route53_record" "frontend" {  
#   for_each = contains(keys(var.instances), "frontend") ? 1 : 0      #if instance map contains keys "frontend" then create 1 record else 0
#   #from instances map if it contains frontend then create 1 record or else 0 records
#   #for_each = contains(keys(all the key and values of map instances will be here), "frontend") ? Creates 1 record (true): else 0 record(false)
#   #condition ? true_value : false_value
#   #for_each = 1 → 1 record/resource is created
#   zone_id = var.hostedzone_id
#   name    = "${var.domain_name}"            # srikarlabs.space
#   type    = "A"
#   ttl     = 1
#   records = [aws_instance.roboshop-instances["frontend"].public_ip]
#   #records = [lookup(aws_instance.roboshop-instances, "frontend").public_ip]   #from the created map aws_instances.roboshop-instances we are checking if frontend exists or not
#   #how to check element key in a map terraform
#   #this is how it looks like below
#   #map({all the created aws instances ...roboshop-instances}, "frontend") 
#   allow_overwrite = true
# }
