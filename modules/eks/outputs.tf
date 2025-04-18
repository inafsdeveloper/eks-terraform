output "cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "cluster_name" {
  value = aws_eks_cluster.main.name
}

output "eks_security_group" {
  value = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}