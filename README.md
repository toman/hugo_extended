## Hugo Extended

This is a quick and dirty Dockerfile based on the one from fleek.co [https://github.com/FleekHQ/site-builder-docker-images](https://github.com/FleekHQ/site-builder-docker-images) . Their's is quite old and not the extended version.

To build a Linux arm version use the packer build:

` packer build --var-file linux-arm.pkvars.hcl hugo-docker.pkr.hcl`