# 2-tier-architecture-terraform

A 2-tier AWS architecture using terraform (for infrastructure provisioning and deployment)
2 tier infrastructure consists of -  a. the prsentation layer  b. the data layer 

getting started/using this terraform script - 
post cloning go to the root directory conataining modules folder and provider.tf and main.tf through termianal and pass your aws credentials as environment 
variables and then use terraform init - > then terraform plan - > then then terraform apply command to deploy this infrastructure on your aws account.

/*Note you may have make changes in the terraform script as per your requirements of resources and regions. HERE THE SCRIPT USES RESOURCES FROM AP-NORTHEAST-1 REGION*/

Apart from this here the concept of /*Terraform Referencing*/,/*Modules*/ and /*inter module referencing*/ is also used.

The structure of the terraform scripts is as follows - 

wordpress-application/
	- provider.tf (AWS)
	- main.tf 
  - modules
	  - ec2/
	 	  - main.tf 
		  - variables.tf
		  - terraform.tfvars
		  - outputs.tf 
		
	  - vpc/
		  - main.tf
		  - route-table.tf
		  - security-groups.tf
		  - variables.tf
		  - terraform.tfvars
		  - outputs.tf 
		
	  - loadbalancer/
		  - main.tf 
		  - variables.tf
		  - terraform.tfvars
		  - outputs.tf 
		
	  - rds/
		  - main.tf
		  - variables.tf
		  - terraform.tfvars
		  - outputs.tf
