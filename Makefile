publish_build_image:
	docker build -t jberlinsky/hashicorp-builder .
	docker push jberlinsky/hashicorp-builder
