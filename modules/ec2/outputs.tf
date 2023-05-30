output "public_1_ip" {
  value = aws_instance.production_1_instance.public_ip
}

output "public_2_ip" {
  value = aws_instance.production_2_instance.public_ip
}

output "public_1_id" {
  value = aws_instance.production_1_instance.id
}

output "public_2_id" {
  value = aws_instance.production_2_instance.id
}