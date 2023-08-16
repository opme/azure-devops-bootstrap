# azure-devops-bootstrap
bootstrap a new Azure DevOps (ADO) organization to deploy to high-security environments

# design

- Using Self hosted virtual machine scale sets.  Reference this article on the reason to use self hosts VMSS for ADO. [Azure DevOps Infrastructure Bootstrap](https://www.linkedin.com/pulse/azure-devops-infrastructure-bootstrap-michael-shamberger%3FtrackingId=6gmV5zxKTkuxULYMGrZy%252Bw%253D%253D/?trackingId=6gmV5zxKTkuxULYMGrZy%2Bw%3D%3D)

- Within the ADO project, I prefer a more open access to pipelines and an Azure development subscription that we know we can repair due to our use of Infrastructure as Code.  A goal is that developers can themselves provision and destroy development environments without the need to contact the DevOps team.  This results in faster productization vs developers working solely on their laptops or a development environment controlled by DevOps.

# sample organization

We create a set of sample ADO projects defined in variables.tf

# Application DevOps pipelines

There are some standard bootstrap pipelines that need to run before the development teams are able to work in their projects.


