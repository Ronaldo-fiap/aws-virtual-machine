output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_id" {
  value = aws_subnet.sn_public.id
}

output "sg_id" {
  value = aws_security_group.sg_public.id
}