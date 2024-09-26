resource "aws_s3_object" "file_upload" {
  bucket  = var.bucket_name
  key     = var.file_name
  content = var.file_content
}

variable "bucket_name" {
  description = "Name of the S3_ bucket"
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

output "file_url" {
  description = "URL of the uploaded file"
  value       = "https://${var.bucket_name}/${aws_s3_object.file_upload.key}"
}