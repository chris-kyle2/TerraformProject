### README.md

```markdown
# Terraform AWS Infrastructure

This repository contains Terraform configurations to set up a complete AWS infrastructure including networking, EC2 instances, and an RDS database instance.

## Infrastructure Overview

### Resources Created:
1. **VPC**: A Virtual Private Cloud with two subnets.
2. **Subnets**:
   - Subnet1 in `us-east-1a`
   - Subnet2 in `us-east-1b`
3. **Security Groups**: Allow inbound traffic for HTTP (80), HTTPS (443), SSH (22), and MySQL (3306).
4. **Network Interfaces**: Two network interfaces attached to the EC2 instances.
5. **Elastic IPs**: Allocated and attached to the network interfaces.
6. **Internet Gateway**: Provides internet access to the VPC.
7. **Route Table and Associations**:
   - A route table with a default route to the internet gateway.
   - Associated with both subnets.
8. **EC2 Instances**:
   - Two web servers in separate subnets.
9. **RDS Instance**: A MySQL database instance configured with a custom subnet group.

---

## File Structure

```plaintext
.
├── main.tf          # Main Terraform configuration
├── outputs.tf       # Outputs for infrastructure attributes
├── variables.tf     # Variable definitions (if needed)
├── provider.tf      # AWS provider configuration
└── README.md        # Documentation
```

---

## Requirements

### Prerequisites:
- Terraform installed on your local machine.
- An AWS account with appropriate permissions.
- An SSH key pair for EC2 instances (`my-ec2-key`).

### Tools:
- [Terraform](https://www.terraform.io/downloads)
- AWS CLI (optional but recommended)

---

## Usage

### Step 1: Clone the Repository
```bash
git clone https://github.com/yourusername/aws-terraform-infrastructure.git
cd aws-terraform-infrastructure
```

### Step 2: Initialize Terraform
```bash
terraform init
```

### Step 3: Review the Plan
```bash
terraform plan
```

### Step 4: Apply the Configuration
```bash
terraform apply
```
Confirm the prompt to create the resources.

---

## Outputs

After applying the configuration, you will get the following outputs:
- **Route Table ID**: The ID of the main route table.
- **EC2 Instance IDs**:
  - `WebServer1`: The ID of the first web server.
  - `WebServer2`: The ID of the second web server.
- **RDS Endpoint**: The connection endpoint for the MySQL database.

Example:
```plaintext
Apply complete! Resources: 15 added, 0 changed, 0 destroyed.

Outputs:

instance1_id = "i-xxxxxxxxxxxxxxxxx"
instance2_id = "i-yyyyyyyyyyyyyyyyy"
rds_endpoint = "appdatabase.xxxxxx.us-east-1.rds.amazonaws.com"
route_table_ID = "rtb-zzzzzzzzzzzzzzzz"
```

---

## Customization

1. **Modify Instance Type**:
   Update the `instance_type` in the `aws_instance` resource blocks to adjust the EC2 specifications.

2. **Change RDS Database Settings**:
   Modify attributes like `allocated_storage`, `engine_version`, or `username` in the `aws_db_instance` resource.

3. **Update Tags**:
   Customize the tags for your resources by editing the `tags` blocks.

---

## Notes

- Ensure the security group allows traffic from your IP address for SSH and MySQL access.
- The database password (`db*pass123`) is hardcoded for demonstration. For production, use environment variables or a secret manager.

---

## Cleaning Up

To destroy the created resources:
```bash
terraform destroy
```
Confirm the prompt to delete all resources.

---

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests to improve this project.

---

## License

This project is licensed under the [MIT License](LICENSE).

```

### Notes:
- Replace `https://github.com/yourusername/aws-terraform-infrastructure.git` with the actual repository URL.
- Ensure sensitive information (like AWS credentials or database passwords) is not committed to the repository. Use `.gitignore` or secure credential management practices.