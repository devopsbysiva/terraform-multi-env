resource "aws_security_group" "allow_ssh_terraform" {
    name = "allow_ssh_t"
    description = "Terraform"
    
    ingress {   #incoming traffic.
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    egress {  #outgoing traffic
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    
    tags = {
        Name = "allow_ssh_tera"
  }
  
}
#creating a ec2 instance.
resource "aws_instance" "expense" {

    for_each = var.instances        
    ami                     = var.ami_id
    instance_type           = each.value
    vpc_security_group_ids =[aws_security_group.allow_ssh_terraform.id]
    
    tags = merge ( var.common_tag, var.environment,
    {
        Name = each.key
    }
    )
  }


