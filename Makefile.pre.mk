all:

docker:
	sudo docker run --rm -ti -v `pwd`:/opt/nodemcu-firmware marcelstoer/nodemcu-build

toolchain:
	cd esp-open-sdk; git submodule update --init --recursive; make STANDALONE=y | tee $(CURDIR)/log.txt

flash-test:
	tools/esptool.py --port /dev/ttyUSB0 flash_id

flash: 
	tools/esptool.py --port /dev/ttyUSB0 write_flash -fm dio 0x00000 bin/nodemcu_integer_master_20180107-1347.bin
