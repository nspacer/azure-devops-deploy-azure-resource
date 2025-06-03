# Azure DevOps Deploy Azure Resource

This project contains Terraform configurations to deploy Azure networking resources with Azure DevOps pipelines.

## Infrastructure Components

- Azure Resource Group (existing)
- Virtual Network with the following configuration:
  - Address space: 10.43.0.0/16
  - Subnets:
    - Web subnet: 10.43.0.0/24
    - App subnet: 10.43.1.0/24

## Prerequisites

- Azure subscription
- Azure DevOps project
- Service connection named 'tacowagon-dev'
- Variable group 'state-data' containing:
  - BACKEND_RESOURCE_GROUP_NAME
  - BACKEND_AZURE_STORAGE_ACCOUNT_NAME
  - BACKEND_AZURE_STORAGE_ACCOUNT_CONTAINER_NAME
  - BACKEND_AZURE_STORAGE_ACCOUNT_KEY_NAME
  - BACKEND_CLIENT_ID
  - BACKEND_CLIENT_SECRET
  - BACKEND_SUBSCRIPTION_ID
  - BACKEND_TENANT_ID

## Pipeline Structure

### PR Pipeline (validate-plan)
- Validates Terraform configurations
- Performs terraform plan
- Saves plan file as artifact

### Merge Pipeline (apply)
- Triggers on main branch
- Downloads plan file
- Applies the terraform changes

## Local Development

1. Initialize Terraform:
```bash
terraform init
```

2. Validate configurations:
```bash
terraform validate
```

3. Plan changes:
```bash
terraform plan
```

## Variables

Customize the deployment by modifying `variables.tf`:
- naming_prefix: Prefix for resource names
- common_tags: Common tags for all resources
- vnet_address_space: VNET address space
- subnet_configuration: Subnet configurations
- resource_group_name: Target resource group name