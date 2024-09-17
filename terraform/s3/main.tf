# s3_module/main.tf

data "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_object" "file_upload" {
  bucket  = aws_s3_bucket.my_bucket.id
  key     = var.file_name
  content = var.file_content
}

# s3_module/variables.tf

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "file_name" {
  description = "Name of the file to be uploaded to S3"
  type        = string
}

variable "file_content" {
  description = "Content of the file to be uploaded"
  type        = string
}

# s3_module/outputs.tf

output "bucket_name" {
  description = "Name of the created S3 bucket"
  value       = aws_s3_bucket.my_bucket.id
}

output "file_url" {
  description = "URL of the uploaded file"
  value       = "https://${aws_s3_bucket.my_bucket.bucket_regional_domain_name}/${aws_s3_object.file_upload.key}"
}