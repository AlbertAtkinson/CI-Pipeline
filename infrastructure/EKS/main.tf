resource "aws_eks_cluster" "kube-cluster" {
  name     = "kube-cluster"
  role_arn = var.cluster-role-arn

  vpc_config {
    subnet_ids         = [var.sub-A-id, var.sub-B-id]
    security_group_ids = [var.sg-A-id]
  }

  tags = {
    Name = "mycluster"
  }
  version = "1.17"
}

resource "aws_eks_node_group" "node" {
  cluster_name    = aws_eks_cluster.kube-cluster.name
  node_group_name = "Nodes"
  node_role_arn   = var.node-role-arn
  subnet_ids      = [var.sub-A-id, var.sub-B-id]
  ami_type        = var.ami
  instance_types  = var.instance-type


  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

}