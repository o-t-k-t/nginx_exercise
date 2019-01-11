terraform {
  backend "gcs" {
    bucket  = "complimentary-terraform-state"
    prefix  = "nginx-exersise"
  }
}

resource "heroku_app" "nginx-exersise" {
  name   = "nginx-exersise"
  region = "us"

  buildpacks = [
    "https://github.com/heroku/heroku-buildpack-nginx"
  ]
}
