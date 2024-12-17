# Setting up ansible-wireguard on AWS EC2

## Prerequisites

1. Launch an EC2 instance with:
   - Ubuntu 22.04/20.04 or Debian 11/12 AMI
   - t3.micro or larger instance type (t3.nano is not recommended)
   - A security group with the following inbound rules:
     - SSH (TCP 22) from your IP
     - HTTP (TCP 80) from anywhere (for Let's Encrypt)
     - HTTPS (TCP 443) from anywhere (for WebUI)
     - WireGuard (UDP 51820) from anywhere
     - Custom UDP 53 from VPC CIDR (for DNS)
   - An Elastic IP address assigned to the instance

2. DNS Requirements:
   - A domain name pointing to your EC2 instance's Elastic IP
   - Proper A record configuration for your domain

## Installation

1. Connect to your EC2 instance:
```bash
ssh ubuntu@your-elastic-ip
# or for Debian AMI
ssh admin@your-elastic-ip
```

2. Run the bootstrap script with AWS mode enabled:
```bash
export AWS_EC2=true
wget https://raw.githubusercontent.com/carriergrade/ansible-wireguard/main/bootstrap.sh -O bootstrap.sh && bash bootstrap.sh
```

## AWS-specific Configuration

The playbook automatically detects AWS environments and will:
- Use AWS-compatible firewall rules
- Configure proper MTU settings for WireGuard
- Set up automatic security updates
- Configure proper DNS resolution

## Security Considerations

1. Security Groups:
   - Keep your security group rules minimal
   - Only open required ports
   - Restrict SSH access to your IP address

2. Network ACLs:
   - Consider using Network ACLs as an additional security layer
   - Follow AWS best practices for network security

3. VPC Configuration:
   - Use a dedicated VPC for your VPN server
   - Enable VPC flow logs for better monitoring

## Monitoring

1. CloudWatch:
   - Enable basic monitoring for your EC2 instance
   - Set up CloudWatch alarms for instance health
   - Monitor network traffic patterns

2. AWS Systems Manager:
   - Consider enabling Systems Manager for easier management
   - Use Session Manager for secure shell access

## Backup

1. Create regular AMI backups:
```bash
aws ec2 create-image --instance-id i-1234567890abcdef0 --name "WireGuard-VPN-Backup-$(date +%Y%m%d)"
```

2. Consider using AWS Backup for automated backups

## Cost Optimization

1. Reserved Instances:
   - Consider purchasing a reserved instance if planning long-term use
   - Can save up to 75% compared to on-demand pricing

2. Network Transfer:
   - Monitor data transfer costs
   - Set up CloudWatch alarms for unusual traffic patterns

## Troubleshooting

1. Connection Issues:
   - Verify security group rules
   - Check route table configurations
   - Verify elastic IP association

2. Performance Issues:
   - Monitor instance CPU credits (if using t3 instances)
   - Check network performance metrics
   - Verify MTU settings

3. DNS Issues:
   - Verify Route 53 configurations
   - Check VPC DNS settings
   - Verify Adguard/Unbound container logs

## Upgrading

When upgrading the EC2 instance:
1. Create an AMI backup
2. Note down your WireGuard configuration
3. Update the instance type if needed
4. Re-run the playbook with AWS_EC2=true

## Best Practices

1. Security:
   - Regularly update the system
   - Monitor AWS trusted advisor recommendations
   - Enable AWS GuardDuty for threat detection

2. Maintenance:
   - Schedule regular backup creation
   - Monitor system logs via CloudWatch
   - Keep track of AWS health events

3. Networking:
   - Use VPC endpoints where applicable
   - Monitor VPC flow logs
   - Regularly review security group rules