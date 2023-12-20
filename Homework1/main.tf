resource "aws_iam_user" "user1" {
  name = "Nurkyz"
}

resource "aws_iam_user" "user2" {
  name = "Kaizen"
}

resource "aws_iam_user" "user3" {
  name = "Hello"
}

resource "aws_iam_user" "user4" {
  name = "World"
}

resource "aws_iam_group" "group1" {
  name = "Devops"
}

resource "aws_iam_group" "group2" {
  name = "QA"
}

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.user1.name,
    aws_iam_user.user2.name,
  ]

  group = aws_iam_group.group1.name

}
resource "aws_iam_group_membership" "team1" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.user3.name,
    aws_iam_user.user4.name,
  ]

  group = aws_iam_group.group2.name

}

output user1{
    value = aws_iam_user.user1
}

output user2{
    value = aws_iam_user.user2.unique_id
}


resource "aws_iam_user" "admin" {
  name = "admin"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "kaizen-nurkyz"
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "kaizen-nurkyz1"
}

