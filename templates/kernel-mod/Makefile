CONFIG_MODULE_SIG=n
obj-m += main.o

all:
	make -C $(KERNEL)/lib/modules/$(KERNEL_VERSION)/build M=$(PWD) modules
clean:
	make -C $(KERNEL)/lib/modules/$(KERNEL_VERSION)/build M=$(PWD) clean
