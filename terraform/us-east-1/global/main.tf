locals {
  project_name  = "snackbar"
  aws_region    = "us-east-1"
  createdby     = "Snackbar-Team"
  version_eks   = "1.31"
  instance_node = "t3.medium"
  volume_type   = "gp3"
  volume_size   = "30"
  #mongodb_cluster_name = "snackbar-tcfase03-dev"
  mongodb_provider_name = "TENANT"
  mongodb_backing_provider_name = "AWS"
  mongodb_instance_size = "M0"
}

