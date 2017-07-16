#cmulk
#makefile to copy the built Image to the template directory (AnyKernel2) and create the flashable zip

SHELL := /bin/bash
clark-simple-kernel.zip: $(shell find template) template/Image template/dt.img
	rm -rf ./clark-simple-kernel.zip; \
	pushd template ; \
	zip -r ../clark-simple-kernel.zip ./* ; \
	popd 

template/Image: ../arch/arm64/boot/Image
	cp ../arch/arm64/boot/Image ./template/Image

template/dt.img: $(shell find ../arch/arm/boot/dts/ -name *.dtb) ../arch/arm/boot/dts/msm8992-clark-p0.dtb  dtbtool/dtbtool
	pushd dtbtool ; \
	./dtbtool -o ../template/dt.img ../../arch/arm/boot/dts/; \
	popd

dtbtool/dtbtool:
	gcc ./dtbtool/dtbtool.c -Wall -o ./dtbtool/dtbtool

clean:
	rm -f ./clark-simple-kernel.zip
	rm -f ./template/Image
	rm -f ./dtbtool/dtbtool
	rm -f ./template/dt.img