all:

docker:
	sudo docker run --rm -ti -v `pwd`:/opt/nodemcu-firmware marcelstoer/nodemcu-build

toolchain:
	cd esp-open-sdk; make STANDALONE=y | tee $(CURDIR)/log.txt
