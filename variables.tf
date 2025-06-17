variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-south-1"

}

variable "aws_instance_type" {
  description = "The type of EC2 instance to create"
  type        = string
  default     = "t2.micro"
  
}
  
variable "aws_root_volume_size" {
  description = "The size of the root volume for the EC2 instance in GB"
  type        = number
  default     = 10
  
}

variable "aws_ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-0f918f7e67a3323f0" # Replace with a valid AMI ID
  
}