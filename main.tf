module "network" {
  source         = "./modules/network"
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  azs            = var.azs             # Required by network module
  project_name   = var.project_name    # Required by network module
}

module "security" {
  source       = "./modules/security"
  vpc_id       = module.network.vpc_id
  project_name = var.project_name
}

module "compute" {
  source            = "./modules/compute"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.network.public_subnets[0]
  security_group_id = module.security.security_group_id  # Pass output from security module
  project_name      = var.project_name
}
