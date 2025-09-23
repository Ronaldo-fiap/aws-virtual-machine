module "network" {
  source      = "./modules/network"
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
  az          = "us-east-1a"
}

module "vm" {
  source         = "./modules/vm"
  subnet_id      = module.network.subnet_id
  sg_id          = module.network.sg_id
  user_data_path = "${path.module}/scripts/user_data.sh"
}