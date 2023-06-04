provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "myuser" {
  name = "tf-user"
}

resource "aws_iam_policy" "customPolicy" {
  name = "tf-custom-policy"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "glacier:InitiateJob",
                "glacier:AbortMultipartUpload",
                "glacier:CreateVault",
                "glacier:ListTagsForVault",
                "glacier:DeleteVault",
                "glacier:DeleteArchive",
                "glacier:ListParts",
                "glacier:DeleteVaultNotifications",
                "glacier:ListJobs",
                "glacier:ListMultipartUploads",
                "glacier:SetVaultNotifications",
                "glacier:CompleteMultipartUpload",
                "glacier:InitiateMultipartUpload",
                "glacier:UploadMultipartPart",
                "glacier:PurchaseProvisionedCapacity",
                "glacier:UploadArchive",
                "glacier:ListVaults",
                "glacier:ListProvisionedCapacity"
            ],
            "Resource": "*"
        }
    ]
}
  EOF
}

resource "aws_iam_policy_attachment" "policyBind" {
  name = "tf-policy-attachment"
  users = [aws_iam_user.myuser.name]
  policy_arn = aws_iam_policy.customPolicy.arn
}