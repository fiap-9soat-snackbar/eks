# EKS Provisioning and Application Deployments

This repository is used to provision an EKS cluster on AWS using Terraform and deploy an application using Helm. It is organized into several modules to separate the concerns of infrastructure provisioning and application deployment.

## Repository Structure

The repository is divided into the following main modules:

1. **Global Module**: 
   - Configures global AWS settings such as S3 buckets for storing Terraform state, IAM roles, and policies used throughout the infrastructure.

2. **VPC Module**: 
   - Provisions a Virtual Private Cloud (VPC) with the necessary subnets, route tables, and internet gateway. It is designed to provide isolated networking for the EKS cluster.

3. **Security Group Module**: 
   - Manages the security groups for the EKS cluster, defining ingress and egress rules to control network access to the nodes and workloads running inside the cluster.

4. **EKS Module**: 
   - This module provisions an Amazon EKS (Elastic Kubernetes Service) cluster running Kubernetes version `1.31`. The cluster includes managed nodes, which are EC2 instances that run the Kubernetes workloads. The module handles the setup of the EKS control plane and node groups.

## EKS Configuration

The EKS module provisions a Kubernetes cluster with the following features:
- Kubernetes version: `1.31`
- Managed nodes: These nodes are EC2 instances managed outside of EKS to provide greater control over instance types, scaling, and lifecycle management.
  
The cluster is integrated with AWS Identity and Access Management (IAM) roles and policies, allowing secure interaction with AWS services such as S3 and DynamoDB.

## Helm Chart for Snackbar Application

The repository also contains a Helm chart template used to deploy the `snackbar` application into the provisioned EKS cluster. The Helm chart configures the following Kubernetes resources:

1. **Deployment**: 
   - Defines the application pods, managing replica counts and ensuring that the application is running consistently.

2. **Service**: 
   - Exposes the application to other services or external traffic. The service type is typically a `LoadBalancer`.

3. **Horizontal Pod Autoscaler (HPA)**: 
   - Configures automatic scaling of the application pods based on CPU or memory utilization. The HPA ensures that the number of pods adjusts dynamically based on the traffic load.

4. **Secrets**: 
   - Manages sensitive information such as database credentials, API keys, or tokens. Secrets are encrypted and stored securely within the Kubernetes cluster.

## Conclusion

This repository simplifies the process of provisioning an EKS cluster and deploying an application using Terraform and Helm. The modular structure allows for flexibility and ease of maintenance, ensuring that each component of the infrastructure and application is independently configurable.

