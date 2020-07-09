variable "schematics_workspace_name" {
    description = "the name of the schematics workspace.  Used to create a tag"
    default = "schematics-not-used"
}

variable "vpc_name" {
    default = "pubfed-dallas"
}

variable "vpc_resource_group" {
    default = "pubfed-vpc"
}

variable "env_resource_group" {
    default = "pubfed-env"
}

variable "region" {
    default = "us-south"
}

variable "generation" {
    default = 2
}

variable "admin_resource_group" {
    description = "The name of the resource group for the Admin IKS cluster"
    default = "account-admin-services"
}

variable "cos_registry_instance" {
    description = "the name of the COS instance for the Openshift Registry bucket"
    default = "cos-openshift-registry"
}



variable address_prefix_1 {
    default = "10.1.64.0/21"
}

variable address_prefix_2 {
    default = "10.1.72.0/21"
}

variable address_prefix_3 {
    default = "10.1.80.0/21"
}

variable app_cidr_block_1 {
    default = "10.1.64.0/24"
}

variable app_cidr_block_2 {
    default = "10.1.72.0/24"
}

variable app_cidr_block_3 {
    default = "10.1.80.0/24"
}

