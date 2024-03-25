# Terraform AWS Infrastructure Provisioning

This project demonstrates the use of HashiCorp Terraform to provision AWS infrastructure, including IAM roles, policies, and AWS resources while ensuring security by restricting modifications to the AWS root account.

## Overview

The purpose of this project is to showcase the capability of Terraform in automating the creation and management of AWS resources. It includes the following main components:

1. IAM Role and Policy: Terraform is used to create an IAM role with granular permissions and associate it with a specific policy. This ensures that only authorized actions can be performed using the role.

2. AWS Resources: Various AWS resources such as EC2 instances, S3 buckets, and RDS databases are provisioned using the IAM role created in the previous step. These resources are essential for running applications or services in the AWS cloud environment.

3. Security Measures: Security best practices are followed to restrict modifications to the infrastructure. The IAM role is disassociated from the policy and removed after the infrastructure is provisioned, leaving no method of modifying the resources except the AWS root account.

## Getting Started

To run the Terraform code in this project, follow these steps:

1. Prerequisites:
   - Install Terraform on your local machine.
   - Configure AWS credentials with appropriate permissions.

2. Clone the Repository:
   git clone https://github.com/your-username/terraform-aws-project.git
   cd terraform-aws-project
   

3. Initialize Terraform:
   terraform init
   

4. Review Terraform Plan:
   terraform plan
   

5. Apply Terraform Changes:
   terraform apply
  

6. Verify AWS Resources:
   Once Terraform has successfully applied the changes, verify that the AWS resources are created as expected in the AWS Management Console.

7. Clean Up:
   After testing, remove the created infrastructure by running:
   ```bash
   terraform destroy
   ```

## Security Considerations

- This project follows the principle of least privilege by granting only the necessary permissions to the IAM role.
- Modifications to the AWS infrastructure are restricted to the AWS root account after the IAM role is removed.

## Contributing

Contributions to this project are welcome! If you find any issues or want to suggest improvements, please open an issue or create a pull request.
