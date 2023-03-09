# Copyright (C) 2021 Tano Systems (https://github.com/tano-systems/luci-app-tn-netports)
# Copyright (C) 2022 waynesg <https://github.com/waynesg>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

LUCI_NAME:=luci-app-netports
PKG_VERSION:=1.1.1

LUCI_TITLE:=Network Interfaces Ports Status
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+luabitop

LUCI_DESCRIPTION:=Network ports status LuCI application

define Package/$(LUCI_NAME)/conffiles
/etc/config/luci_netports
endef

define Package/$(LUCI_NAME)/postinst
#!/bin/sh
if [ ! -f /etc/config/luci_netports ]; then
    echo "config global 'global'" > /etc/config/luci_netports
fi

define Package/$(LUCI_NAME)/prerm
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
