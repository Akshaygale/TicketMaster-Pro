module "networking" {
  source = "./networking"
  project-name = var.project-name
  environment = var.environment
}

module "security" {
  source = "./security"
  vpc_id = module.networking.vpc_id
}

module "compute" {
  source = "./compute"
  vpc_id = module.networking.vpc_id
  public_subnet = module.networking.public_subnet_id

  alb_sg_id = module.security.alb_sg_id
  app_sg_id = module.security.alb_sg_id
}

module "database" {
  source = "./database"

  vpc_id  = module.networking.vpc_id
  subnet  = module.networking.public_subnet_id
}

module "cache" {
  source = "./cache"

  subnet = module.networking.public_subnet_id
}
