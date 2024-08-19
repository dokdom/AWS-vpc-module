# VPC 모듈 호출
module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = "10.0.0.0/16"
  vpc_name            = "test_modules_vpc"
  public_subnet_cidrs = ["10.0.0.0/24", "10.0.1.0/24"]
  public_subnet_azs   = ["ap-northeast-2a", "ap-northeast-2c"]
  private_subnet_cidrs = ["10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
  private_subnet_azs  = ["ap-northeast-2a", "ap-northeast-2c", "ap-northeast-2a", "ap-northeast-2c"]
  public_subnet_ids   = module.vpc.public_subnet_ids
  private_subnet_ids  = module.vpc.private_subnet_ids
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}
