output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_cluster_security_group" {
  value = module.eks.eks_security_group
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "bastion_public_ip" {
  value = module.bastion.bastion_public_ip
}