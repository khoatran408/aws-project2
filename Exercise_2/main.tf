provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "/home/khoa/.aws/credentials"
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "greet_lambda.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "greet_lambda.lambda_handler"
  runtime       = "python3.7"
}

resource "aws_vpc" "udacity" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "Udacity"
  }
}

resource "aws_subnet" "udacity_subnet" {
  vpc_id     = aws_vpc.udacity.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "Udacity"
  }
}