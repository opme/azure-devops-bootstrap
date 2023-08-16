# azure-devops-bootstrap
bootstrap a new Azure DevOps (ADO) organization to deploy to high-security environments

# Design

- Use terraform IAC to create both the ADO setup and the needed resources within the azure private networks such as self hosted VMSS and key vaults.  We assume private link networking and managed identity is used wherever possible.

- Naming convention and tagging conventions are taken from the Cloud Adoption Framework (CAF)

- Using Self hosted virtual machine scale sets.  Reference this article on the reason to use self hosts VMSS for ADO. [Azure DevOps Infrastructure Bootstrap](https://www.linkedin.com/pulse/azure-devops-infrastructure-bootstrap-michael-shamberger%3FtrackingId=6gmV5zxKTkuxULYMGrZy%252Bw%253D%253D/?trackingId=6gmV5zxKTkuxULYMGrZy%2Bw%3D%3D)

- Self hosted runner has uses custom OS images created with Packer directly pullinf the scripts that [Microsoft uses](https://github.com/actions/runner-images) for both ADO and Github Actions.  If you need further customization of those yiu will need to fork the project.  The buildagent/ directory in this github repository has pipelines for these.  We need to use a Microsoft hosted agent to build these and publish them as artifacts so that we can pull them into our virtual networks to be used when creating the VMSS.

- Within the ADO project, I prefer a more open access to pipelines and an Azure development subscription that we know we can repair due to our use of Infrastructure as Code.  A goal is that developers can themselves provision and destroy development environments without the need to contact the DevOps team.  This results in faster productization vs developers working solely on their laptops or a development environment controlled by DevOps.

# Sample organization

We create a set of sample ADO projects defined in variables.tf

# Application DevOps pipelines

There are some standard bootstrap pipelines that need to run before the development teams are able to work in their projects.


