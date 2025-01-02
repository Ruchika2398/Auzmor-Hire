provider "aws" {
  region = "us-east-1"
}

resource "aws_eks_cluster" "example" {
  name = "example-cluster"
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    subnet_ids = aws_subnet.subnet.*.id
  }
}

resource "aws_eks_node_group" "example" {
  cluster_name    = aws_eks_cluster.example.name
  node_group_name = "example-node-group"
  node_role_arn   = aws_iam_role.eks_node.arn

  subnet_ids = aws_subnet.subnet.*.id

  scaling_config {
    desired_size = 2
    max_size     = 5
    min_size     = 1
  }
}
