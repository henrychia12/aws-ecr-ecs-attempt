variable "AWS_REGION" {
    default = "eu-west-2"
}
variable "PATH_TO_PRIVATE_KEY" {
    default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
    default = "mykey.pub"
}
variable "ECS_INSTANCE_TYPE" {
    default = "t2.micro"
}
variable "ECS_AMIS" {
    type = "map"
    default = {
        eu-west-2 = "ami-0de1dc478496a9e9b"
        us-west-2 = "ami-0e5e051fd0b505db6"
        us-east-2 = "ami-0dca97e7cde7be3d5"
    }
}
