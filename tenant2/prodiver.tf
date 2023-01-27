terraform {
  backend "remote" {
    organization = "example-org-62d565"

    workspaces {
      name = "ecs-infra2"
    }
  }

  required_version = "1.3.6"
}
