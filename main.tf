module "network" {
  source         = "./modules/network"
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
}

module "security" {
  source      = "./modules/security"
  vpc_id      = module.network.vpc_id
}

module "compute" {
  source             = "./modules/compute"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_id          = module.network.public_subnets[0]
}
