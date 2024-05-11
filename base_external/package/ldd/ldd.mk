
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
LDD_VERSION = c592869cae45781fbbc3b1c9fe13b22cebdb2f03
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-charlezkwan.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = misc-modules/
LDD_MODULE_SUBDIRS += scull/
LDD_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED) KERNELDIR=$(LINUX_DIR)

LDD_CONFIGURE_OPTS += KERNELDIR=$(LINUX_DIR) 
LDD_CONFIGURE_OPTS += ARCH=$(KERNEL_ARCH)
LDD_CONFIGURE_OPTS += CROSS_COMPILE=$(TARGET_CROSS)


# define LDD_BUILD_CMDS
#     $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules modules
#     $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull modules
# endef

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))