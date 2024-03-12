provider "aws" {
  region = var.aws_region
}

resource "aws_iam_role" "Cloud_Sec_Role" {
  name = "Cloud_Sec_Role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "Cloud_Sec_policy" {
  name        = "Cloud_Sec_policy"
  description = "Example IAM policy for infrastructure tasks"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:RunInstances",
        "ec2:DescribeInstances",
        "ec2:TerminateInstances"
        
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "Cloud_Sec_attachment" {
  policy_arn = aws_iam_policy.Cloud_Sec_policy.arn
  role       = aws_iam_role.Cloud_Sec_Role.name
}

resource "aws_instance" "Cloud_Sec_instance" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  count         = 1

  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
   tags = {
    Name = "Cloud_Sec_instance"
  }
  
}
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  role = aws_iam_role.Cloud_Sec_Role.name
}
