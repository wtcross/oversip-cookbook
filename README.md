oversip-cookbook
================

A Chef coookbook for installing and configuring [OverSIP][OverSIP]

## Requirements

### Platform

+ Tested on Debian 7.4

### Cookbooks
+ [apt](https://github.com/opscode-cookbooks/apt)

### Installation Attributes

+ node['oversip']['install_method'] - Method used for installation (package/tarball). Defaults to `package`.
+ node['oversip']['service'] - Service name for OverSIP
+ node['oversip']['run'] - Whether or not to run OverSIP after installation and configuration. Default true
+ node['oversip']['user'] - Username used to run OverSIP. Default `oversip`
+ node['oversip']['group'] - Group to add the user to. Default `oversip`
+ node['oversip']['config_dir'] - Directory to place OverSIP configuration. Default `/etc/oversip`
+ node['oversip']['config_file'] - Name of the OverSIP configuration file. Default `oversip.conf`

### OverSIP Configuration Attributes ([docs](http://oversip.net/documentation/))

All OverSIP configuration options can be set through node attributes.

#### OverSIP Core Config ([docs](http://www.oversip.net/documentation/1.4.x/configuration/oversip_conf/#section_core))
+ node['oversip']['core']['nameservers']
+ node['oversip']['core']['syslog_facility']
+ node['oversip']['core']['syslog_level']


#### OverSIP SIP Config ([docs](http://www.oversip.net/documentation/1.4.x/configuration/oversip_conf/#section_sip))
+ node['oversip']['sip']['sip_udp']
+ node['oversip']['sip']['sip_tcp']
+ node['oversip']['sip']['sip_tls']
+ node['oversip']['sip']['enable_ipv4']
+ node['oversip']['sip']['listen_ipv4']
+ node['oversip']['sip']['advertised_ipv4']
+ node['oversip']['sip']['enable_ipv6']
+ node['oversip']['sip']['listen_ipv6']
+ node['oversip']['sip']['advertised_ipv6']
+ node['oversip']['sip']['listen_port']
+ node['oversip']['sip']['listen_port_tls']
+ node['oversip']['sip']['use_tls_tunnel']
+ node['oversip']['sip']['listen_port_tls_tunnel']
+ node['oversip']['sip']['callback_on_client_tls_handshake']
+ node['oversip']['sip']['local_domains']
+ node['oversip']['sip']['tcp_keepalive_interval']
+ node['oversip']['sip']['record_route_hostname_tls_ipv4']
+ node['oversip']['sip']['record_route_hostname_tls_ipv6']


#### OverSIP WebSocket Config ([docs](http://www.oversip.net/documentation/1.4.x/configuration/oversip_conf/#section_websocket))
+ node['oversip']['websocket']['sip_ws']
+ node['oversip']['websocket']['sip_wss']
+ node['oversip']['websocket']['enable_ipv4']
+ node['oversip']['websocket']['listen_ipv4']
+ node['oversip']['websocket']['advertised_ipv4']
+ node['oversip']['websocket']['enable_ipv6']
+ node['oversip']['websocket']['listen_ipv6']
+ node['oversip']['websocket']['advertised_ipv6']
+ node['oversip']['websocket']['listen_port']
+ node['oversip']['websocket']['listen_port_tls']
+ node['oversip']['websocket']['use_tls_tunnel']
+ node['oversip']['websocket']['listen_port_tls_tunnel']
+ node['oversip']['websocket']['callback_on_client_tls_handshake']
+ node['oversip']['websocket']['max_ws_message_size']
+ node['oversip']['websocket']['max_ws_frame_size']
+ node['oversip']['websocket']['ws_keepalive_interval']


#### OverSIP TLS Config ([docs](http://www.oversip.net/documentation/1.4.x/configuration/oversip_conf/#section_tls))
+ node['oversip']['tls']['public_cert']
+ node['oversip']['tls']['private_cert']
+ node['oversip']['tls']['ca_dir']


#### OverSIP Default Proxy Config ([docs](http://www.oversip.net/documentation/1.4.x/configuration/proxies_conf/))
The default proxy configuration that goes into `proxies.conf`.

+ node['oversip']['default_proxy']['do_record_routing']
+ node['oversip']['default_proxy']['use_dns_cache']
+ node['oversip']['default_proxy']['dns_cache_time']
+ node['oversip']['default_proxy']['use_blacklist']
+ node['oversip']['default_proxy']['blacklist_time']
+ node['oversip']['default_proxy']['use_naptr']
+ node['oversip']['default_proxy']['use_srv']
+ node['oversip']['default_proxy']['transport_preference']
+ node['oversip']['default_proxy']['force_transport_preference']
+ node['oversip']['default_proxy']['ip_type_preference']
+ node['oversip']['default_proxy']['dns_failover_on_503']
+ node['oversip']['default_proxy']['timer_B']
+ node['oversip']['default_proxy']['timer_C']
+ node['oversip']['default_proxy']['timer_F']
+ node['oversip']['default_proxy']['callback_on_server_tls_handshake']


#### OverSIP Additional Proxy Config ([docs](http://www.oversip.net/documentation/1.4.x/configuration/proxies_conf/))

+ node['oversip']['proxies'] - Array of JSON objects

TODO