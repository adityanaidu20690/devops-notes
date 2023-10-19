output "keys" {

  value = aws_key_pair.developer.key_name
}

output "secure" {
  value = aws_security_group.allow_tls.id
}