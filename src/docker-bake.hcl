// docker-bake.hcl
target "docker-metadata-action" {}

target "build" {
  inherits = ["docker-metadata-action"]
  context = "./src/"
  platforms = [
    "linux/amd64",
    "linux/aarch64"
  ]
}
