#cmulk
#makefile to copy the built Image to the template directory (AnyKernel2) and create the flashable zip

SHELL := /bin/bash
clark-simple-kernel.zip: $(shell find template) template/Image
	rm -rf ./clark-simple-kernel.zip; pushd template; zip -r ../clark-simple-kernel.zip ./* ; popd 

template/Image: ../arch/arm64/boot/Image
	cp ../arch/arm64/boot/Image ./template/Image