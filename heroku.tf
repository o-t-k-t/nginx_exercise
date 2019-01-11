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
    "heroku/ruby",
    "https://github.com/heroku/heroku-buildpack-nginx"
  ]
}

resource "heroku_addon" "postgresql" {
  app  = "${heroku_app.nginx-exersise.name}"
  plan = "heroku-postgresql:hobby-dev"
}
