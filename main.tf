data "azurerm_client_config" "current" {} 

module "azure-terraformer" {
  source  = "markti/azure-terraformer/azuredevops"
  version = "1.0.13"
}

provider "azurerm" {
  features {}
}

provider "azuredevops" {
    org_service_url       = ""
    personal_access_token = ""
}

resource "azuredevops_project" "test" {
  name        = var.project_name
  description = "Go compilation project"
}

module "multi_stage_repo" {
  source = "./modules/repo/multi-stage-terraform"

  application_name = var.application_name
  project_id       = azuredevops_project.test.id
  repo_name        = "test-terraform"
  reviewers        = var.reviewers

  environments = {
    dev = {
      azure_credential = var.dev_subscription
      azure_backend    = var.dev_backend
    }
    prod = {
      azure_credential = var.prod_subscription
      azure_backend    = var.prod_backend
    }
  }
}
