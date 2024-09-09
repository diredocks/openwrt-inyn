include $(TOPDIR)/rules.mk

PKG_NAME:=inyn
PKG_VERSION:=0.0.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/diredocks/inyn.git
PKG_SOURCE_VERSION:=HEAD
PKG_MIRROR_HASH:=skip

PKG_MAINTAINER:=Diredocks <napking@163.com>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_SOURCE_DIR:=$(PKG_BUILD_DIR)/src

define Package/inyn
  SECTION:=net
  CATEGORY:=Network
  TITLE:=I'm not your node
  URL:=https://github.com/diredocks/inyn
  DEPENDS:=+libopenssl +libpcap
endef

define Package/inyn/description
  Modern H3C 802.1x Client
endef

define Package/inyn/install
	$(INSTALL_DIR) $(1)/usr/bin
	# Install the compiled binary from the build directory
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/inyn $(1)/usr/bin/
endef

$(eval $(call BuildPackage,inyn))

