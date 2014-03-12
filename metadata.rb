name             "oversip"
maintainer       "Tyler Cross"
maintainer_email "tyler@crosscollab.com"
license          "MIT"
description      "Installs/Configures OverSIP"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

recipe "freeswitch", "Install OverSIP"
recipe "freeswitch::package", "Install OverSIP from a package"
recipe "freeswitch::tarball", "Install OverSIP from tarball"

depends 'apt', '~> 2.2'

supports "debian", ">= 6.0"
supports "ubuntu", ">= 12.04"
