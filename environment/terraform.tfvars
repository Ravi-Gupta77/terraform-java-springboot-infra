env = "dev"
tags = {
  env       = "dev"
  Name      = "java-springboot"
  terraform = true
}

# vpc
cidr                    = "15.0.0.0/16"
map_public_ip_on_launch = true
enable_nat_gateway      = true
single_nat_gateway      = true
one_nat_gateway_per_az  = false
