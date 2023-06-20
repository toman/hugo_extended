packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source  = "github.com/hashicorp/docker"
    }
  }
}

variable "docker_image" {
  type    = string
  default = "node:latest"
}

source "docker" "node" {
  image  = var.docker_image
  commit = true
}

variable "hugo_version" {
  type    = string
  default = "0.114.0"
}

variable "hugo_version_tag" {
  type    = string
  default = "1.14.0"
}

variable "hugo_platform" {
  type    = string
  default = "Linux-64bit"
}

build {
  name = "hugo-extended"
  sources = [
    "source.docker.node"
  ]
  provisioner "shell" {
    environment_vars = [
      "TAR_FILE=hugo_extended_${var.hugo_version}_${var.hugo_platform}.tar.gz",
    ]
    inline = [
      "apt-get update && apt-get install -y wget",
      "wget https://github.com/gohugoio/hugo/releases/download/v${var.hugo_version}/$TAR_FILE",
      "tar -xf $TAR_FILE -C /usr/local/bin",
      "hugo version",
      "rm $TAR_FILE",
      "wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash"
    ]
  }

  post-processor "docker-tag" {
    repository = "lillibolero/hugo_extended_pkr"
    tags       = ["${var.hugo_version_tag}", "latest"]
    only       = ["docker.node"]
  }

}
