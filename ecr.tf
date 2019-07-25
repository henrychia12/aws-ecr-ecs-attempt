resource "aws_ecr_repository" "myapp" {
    name = "myapp"
}
resource "aws_ecr_repository" "backend" {
    name = "backend"
}
resource "aws_ecr_repository" "mongo" {
    name = "mongo"
}

