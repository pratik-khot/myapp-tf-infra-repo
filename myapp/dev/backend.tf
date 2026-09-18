# terraform {
#   backend "s3" {
#     bucket = ""
#     use_lockfile = true

#   }

# }

terraform {

  cloud {

    organization = "aws-tf-org-pk"

    workspaces {
      name = "myapp-dev"
    }
  }
}