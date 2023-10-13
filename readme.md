<h1 align="center"> AWS </h1>
<h2 align="center"> Create Custom AWS-VPC (Virtual Private Cloud) Using Terraform </h2>

![imagegit](https://github.com/shankar439/Images/assets/70714976/930efa49-e276-4493-9090-6461f9f51e9a)

## What is AWS VPC and it's advantages ?. 

  - `AWS VPC is a service which allows us to create a isolated AWS Cloud where we can launch AWS resources with complete control over IP addressing, routing, security, and network configuration. `
  - ### Advantages:
    - `Isolation` -  VPCs provide network isolation, allowing ous to have full control over your virtual network environment in aws cloud.
    - `Security` - Security Groups and NACLs offer fine-grained control over inbound and outbound traffic to and from our instances(VM).
    - `Customization` - We can design our VPC with its own IP address range, subnets, and routing tables to meet the specific needs.

## What is Terraform and it's advantages ?. 

  - `Terraform is an infrastructure as code (IaC) tool. It enables us to define and provision infrastructure and applications through code in declarative way, making it easier to manage and automate infrastructure deployments.`
  - ### Advantages:
    - `Infrastructure as Code (IaC)` -  Terraform promotes a code-based approach to infrastructure management, which offers several benefits, including version control.
    - `Declarative Syntax` - Terraform uses a declarative language, which means we specify what we want. This abstracts the complexity of managing infrastructure details.
    - `Automation and Consistency` - Terraform enables automation of infrastructure provisioning and ensures consistent environments. This reduces human error and accelerates deployment processes.
  
<br>
<br>



<h1 align="center">Lets Begin </h1>

- AWS Resources going to be covered.

    - [AWS_VPC](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)
    - [AWS_Subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)
    - [AWS_SecurityGroup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group.html)
    - [AWS_InternetGateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)
    - [EC2_instance_connect](https://github.com/hashicorp/terraform-provider-aws/issues/32011)
    - [AWS_RouteTable](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)
    - [AWS_NAT_Gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway)




<h2 align="center">Terraform</h2>

- Throughout this AWS-VPC Terraform code I have used Resources rather Module.
- [We can also use module to create custom VPC](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)


## Explanation

- I have created a AWS-VPC with cidr block 10.0.0.0/16
- In this architecture it contain three public and private subnet to retail Highly Available and private Application.
- As of this setup it only contain one AWS managed [NAT-Gateway](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html) in public subnet.
- To access EC2 instance in Private subnet i have included the [EC2-Instance-Connect-Endpoint](https://aws.amazon.com/blogs/compute/secure-connectivity-from-public-to-private-introducing-ec2-instance-connect-endpoint-june-13-2023/)
- And finally added spot instance.
- To Apply the code, first initialize the provider using [terraform init](https://developer.hashicorp.com/terraform/cli/commands/init), and to apply use [terraform apply](https://developer.hashicorp.com/terraform/cli/commands/apply). 

<br>
<br>


## Conclusion

- We have seen what AWS-VPC, Terraform and its advantages.
- AWS VPC is a fundamental building block for deploying applications and services in the AWS cloud, offering a secure, customizable, and scalable network environment that enables you to meet the specific requirements.
- Terraform is a powerful tool for managing infrastructure and application deployments.


<br>

# END