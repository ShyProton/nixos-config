#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/module.h>

MODULE_LICENSE("GPL");

static int __init my_init_function(void) {
  printk(KERN_INFO "Hello, kernel module!\n");
  return 0;
}

static void __exit my_exit_function(void) {
  printk(KERN_INFO "Goodbye, kernel module\n");
}

module_init(my_init_function);
module_exit(my_exit_function);
