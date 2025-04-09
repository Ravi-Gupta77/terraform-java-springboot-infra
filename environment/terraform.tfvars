env = "dev"
tags = {
  env       = "dev"
  Name      = "java-springboot"
  terraform = true
}

# vpc
cidr                    = "15.0.0.0/20"
map_public_ip_on_launch = true
enable_nat_gateway      = false
single_nat_gateway      = false
one_nat_gateway_per_az  = false
