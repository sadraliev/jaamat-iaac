# Guide

# Usage
To use the commands provided, you can also use a Makefile for convenience. Here’s how you can use it:
Initialize the configuration:

```bash
cd terraform/
make init
```
Plan the changes:
```bash
make plan
```
Apply the changes:
```bash
make apply
```
Destroy the resources:
```bash
make destroy
```
**Note**: Ensure that you have the necessary permissions and have reviewed the plan before applying changes or destroying resources.

## Additional Notes
- Reviewing Plans: Always review the output of terraform plan carefully to understand the changes that will be made before applying them.
- Auto-Approval: If you want to skip the confirmation prompt when applying changes, you can use the -auto-approve flag with terraform apply:
```bash
terraform apply -auto-approve
```
- State Management: Terraform manages state files that contain information about your infrastructure. Ensure these files are kept secure and backed up if necessary.

- Environment Setup: Ensure Terraform is installed on your system and you have configured any required environment variables or credentials for cloud providers.

For more information on Terraform, refer to the official Terraform documentation.

# Configure AWS Credentials
Create a New IAM User:
1. Log in to your AWS Management Console > Search “IAM”
2. In the IAM dashboard, click on “Users” in the sidebar
3. Click the “Create user” button > Choose a username for the new user
4. Create Group for “Admin Access” > Add user to the group
5. Click Next > Next > Click on the user that you’ve created just now.
6. Click on “Create access key” > Select Use case as “Local code” > Next
7. A confirmation page will display the “Access key ID” and “Secret access key” for the user.

# Sensitive values
create `secrets.auto.tfvars` file with the following values:
```tf
aws_access_key = ""
aws_secret_key = ""

key-name                    = "tf-deployer-key"
```

# connect to server
```bash
sudo ssh -i "ssh-key.pem" ubuntu@ip-address.compute.amazonaws.com
# add the to the docker user
sudo usermod -aG docker $USER
# reenter to apply changes
exit
```



Feel free to modify or extend this `README.md` file according to your project needs!
