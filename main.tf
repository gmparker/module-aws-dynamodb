provider "aws" {
  region = "us-west-2"
}

resource "aws_dynamodb_table" "http-crud-tutorial-items" {
  name             = "http-crud-tutorial-items"
  hash_key         = "id"
  billing_mode     = "PAY_PER_REQUEST"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "id"
    type = "S"
  }

  replica {
    region_name = "us-east-2"
    propagate_tags = true
  }

  tags = {
    Name        = "http-crud-tutorial-items"
    team        = "enterprise architecture"
  }
}