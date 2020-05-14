data "ibm_resource_group" "vpc_resource_group" {
    name = "${var.vpc_resource_group}"
}

variable "environment" {
    default = "sandbox"
}

##############################################################################
# Create VPC
##############################################################################
module "vpc" {

    source = "./modules/vpc"
    
    vpc_name                   = var.vpc_name
    region                     = var.region
    environment                = var.environment
    schematics_workspace_name  = var.schematics_workspace_name
    vpc_resource_group         = var.vpc_resource_group
    address_prefix_cidr_blocks = ["10.1.0.0/21", "10.1.8.0/21", "10.1.16.0/21"]

}


##############################################################################
# Create Public Gateways
##############################################################################
module "public_gateways" {
    source = "./modules/public_gateways"

    vpc_resource_group = var.vpc_resource_group
    vpc_id             = module.vpc.vpc_id
    vpc_name           = var.vpc_name
    region             = var.region

}


##############################################################################
# Create Application Subnets
##############################################################################
module "app_subnets" {
    source = "./modules/subnets"

    vpc_id             = module.vpc.vpc_id
    resource_group     = data.ibm_resource_group.vpc_resource_group.id
    region             = var.region
    subnet_name_prefix = "${var.vpc_name}-app"
    network_acl        = module.vpc.network_acl_id
    subnet_cidr_blocks = ["${var.app_cidr_block_1}", "${var.app_cidr_block_2}", "${var.app_cidr_block_3}"]
    public_gateways    = [module.public_gateways.zone1_gateway_id, module.public_gateways.zone2_gateway_id, module.public_gateways.zone3_gateway_id]

}



output vpc_id {
 value = module.vpc.vpc_id
}

output app_subnet1_id {
    value = module.app_subnets.subnet1_id
}

output app_subnet2_id {
    value = module.app_subnets.subnet2_id
}

output app_subnet3_id {
    value = module.app_subnets.subnet3_id
}
