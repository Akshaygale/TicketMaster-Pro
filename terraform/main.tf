module "networking" {
  source       = "./networking"
  project-name = var.project-name
  environment  = var.environment
}

module "security" {
  source = "./security"
  vpc_id = module.networking.vpc_id
}


module "database" {
  source = "./database"

  vpc_id = module.networking.vpc_id
  subnet = module.networking.public_subnet_id
}

module "cache" {
  source = "./cache"

  subnet = module.networking.public_subnet_id
}

module "ecr" {
  source = "./ecr"
}

module "alb" {
  source = "./alb"
  vpc_id = module.networking.vpc_id
  public_subnet = module.networking.public_subnet_id
  alb_sg_id = module.security.alb_sg_id
}

module "compute" {
  source = "./compute"
  vpc_id = module.networking.vpc_id
  public_subnet = module.networking.public_subnet_id
  app_sg_id = module.security.app_sg_id
  frontend_lt_id = module.alb.frontend_tg_arn
  backend_lt_id = module.alb.backend_tg_arn
}

module "monitoring" {
  source = "./monitoring"
  frontend_asg_id = module.compute.frontend_asg_id
  backend_asg_id = module.compute.backend_asg_id
}