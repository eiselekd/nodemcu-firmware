all:

docker:
	sudo docker run --rm -ti -v `pwd`:/opt/nodemcu-firmware marcelstoer/nodemcu-build

toolchain:
	cd esp-open-sdk; git submodule update --init --recursive; make STANDALONE=y | tee $(CURDIR)/log.txt

flash-test:
	esptool/esptool.py --port /dev/ttyUSB0 flash_id

flash-clear:
	esptool/esptool.py --port /dev/ttyUSB0 erase_flash

flash-split: 
	esptool/esptool.py --port /dev/ttyUSB0 write_flash -fm dio -fs 32m -ff 40m 0x00000 bin/0x00000.bin 0x10000 bin/0x10000.bin

flash-bin: 
	esptool/esptool.py --port /dev/ttyUSB0 write_flash -fm dio -fs 32m -ff 40m 0x00000 bin/nodemcu_integer_master_20180107-1529.bin

upload:
	luatool/luatool/luatool.py -p /dev/ttyUSB0 -b 115200 -f lua_examples/pcm/play_file.lua

# luatool/luatool/luatool.py -p /dev/ttyUSB0 -b 115200 -f lua_examples/pcm/jump_8k.u8

##################
flash-pcm:
	@echo "Local files:" 
	ls -la local/fs
	esptool/esptool.py --port /dev/ttyUSB0 write_flash -fm dio -fs 32m -ff 40m 0x00000 Makefile.pre.mk.bin/firmware_pcm.bin 0x70000 Makefile.pre.mk.bin/spiffs-32mb.bin
	sleep 5
	@echo "remote files:" 
	luatool/luatool/luatool.py -p /dev/ttyUSB0 -b 115200 --list



