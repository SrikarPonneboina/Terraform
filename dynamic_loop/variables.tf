variable "ingress_rules" {
    default = {
        ssh = {
            port = 22
            cidr_blocks =["0.0.0.0/0"]
            description = "opening port 22 from all ip for ssh access"
        },
        http = {
            port = 80
            cidr_blocks = ["0.0.0.0/0"]
            description = "opening port 80 from all ip for web access"
        },
        mysql = {
            port = 3306
            cidr_blocks = ["0.0.0.0/0"]
            description = "opening port 3306 from all ip for DB access"
        },
        tcp = {
            port = 8080
            cidr_blocks = ["0.0.0.0/0"]
            description = "This allows connections to port 8080 from all ip for custom protocol access"
        }
    }
}
