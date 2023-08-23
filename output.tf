output "bt_env_dns_name" {
  description = "display the DNS name"
  value = aws_elastic_beanstalk_environment.docker-env.cname
}