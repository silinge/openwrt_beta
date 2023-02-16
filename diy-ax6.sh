#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

#修正连接数（by ベ七秒鱼ベ）
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

# themes添加（svn co 命令意思：指定版本如https://github）
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf package/lean/luci-theme-argon

git clone -b 18.06 https://github.com/kiddin9/luci-theme-edge.git package/luci-theme-edge
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

#添加额外非必须软件包
git clone https://github.com/vernesong/OpenClash.git package/OpenClash
git clone https://github.com/sirpdboy/luci-app-advanced package/luci-app-advanced



# Add luci-theme-argon
