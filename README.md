# azure-devops-bootstrap
bootstrap a new Azure DevOps organization to deploy to high-security environments

# design

Within the ADO project, I prefer a more open access to pipelines and an Azure development subscription that we know we can repair due to our use of Infrastructure as Code.  A goal is that developers can themselves provision and destroy development environments without the need to contact the DevOps team.

# sample organization

We create a set of sample projects defined in variables.tf

# Application DevOps pipelines

There are some standard bootstrap pipelines that need to run before the development teams are able to work in their projects.


