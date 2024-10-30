variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"  
}

variable "instances"{
    type = map
    # default ={
    #     mysql_prod = "t2.small"
    #     backend_prod = "t2.micro"
    #     frontend_prod = "t2.micro"
    # }
}

variable "common_tag"{
    type = map
    default = {
        Project = "expense"
        terraform = yes
        # environment = "Prod"
    }  
}

variable "zone_id" {
    type =string
    default = "Z08507192LTGIE6IND07Q"
}

variable "domain_name" {
    type = string
    default = "devgani.online"
}