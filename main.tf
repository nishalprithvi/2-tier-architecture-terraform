module "vpc" {
    source = "./modules/vpc"    
}

module "ec2" {
    source            = "./modules/ec2"
    public_subnet1_id = module.vpc.public_subnet1_id
    public_subnet2_id = module.vpc.public_subnet2_id
    prod-sg-id        = module.vpc.production-instance-sg-id
    rds-db-id         = module.database.rds_master-id    
}

module "loadbalancer" {
    source            = "./modules/loadbalancer"
    prod-sg-id        = module.vpc.production-instance-sg-id
    public_subnet1_id = module.vpc.public_subnet1_id
    public_subnet2_id = module.vpc.public_subnet2_id
    vpc-id            = module.vpc.vpc-id
    public-1-id       = module.ec2.public_1_id 
    public-2-id       = module.ec2.public_2_id
}

module "database" {
    source              = "./modules/rds"
    private-subnet-1-id = module.vpc.private_subnet1_id
    private-subnet-2-id = module.vpc.private_subnet2_id
    db-sg-id            = module.vpc.database-sg-id  
}