provider "aws" {
  region = var.region
}

resource "aws_elastic_beanstalk_application" "docker-app" {
  name        = "sprintboardapp"
}

resource "aws_elastic_beanstalk_environment" "docker-env" {
  name                = "sprintboardapp-blue-env"
  application         = aws_elastic_beanstalk_application.docker-app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.6.0 running Docker"
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = "sprintboard-eb-deploy"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "InstanceType"
    value = "t2.micro"
  }
}

resource "aws_elastic_beanstalk_environment" "docker-env" {
  name                = "sprintboardapp-green-env"
  application         = aws_elastic_beanstalk_application.docker-app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.6.0 running Docker"
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = "sprintboard-eb-deploy"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "InstanceType"
    value = "t2.micro"
  }
}
