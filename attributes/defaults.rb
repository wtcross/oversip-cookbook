default['oversip']['install_method'] = case node['platform']
when 'ubuntu', 'debian'
  'package'
else
  'tarball'
end

default['oversip']['service'] = 'oversip'

#####################################
#### /etc/default/oversip config ####
#####################################
default['oversip']['run'] = 'yes'

default['oversip']['user'] = 'oversip'
default['oversip']['group'] = 'oversip'

default['oversip']['config_dir'] = '/etc/oversip'
default['oversip']['server_file'] = 'server.rb'
default['oversip']['config_file'] = 'oversip.conf'

#####################
#### Core config ####
#####################
default['oversip']['core']['nameservers'] = 'null'

default['oversip']['core']['syslog_facility'] = 'daemon'

default['oversip']['core']['syslog_level'] = 'debug'

####################
#### SIP config ####
####################
default['oversip']['sip']['sip_udp'] = 'yes'

default['oversip']['sip']['sip_tcp'] = 'yes'

default['oversip']['sip']['sip_tls'] = 'no'

default['oversip']['sip']['enable_ipv4'] = 'yes'

default['oversip']['sip']['listen_ipv4'] = 'null'

default['oversip']['sip']['advertised_ipv4'] = 'null'

default['oversip']['sip']['enable_ipv6'] = 'yes'

default['oversip']['sip']['listen_ipv6'] = 'null'

default['oversip']['sip']['advertised_ipv6'] = 'null'

default['oversip']['sip']['listen_port'] = 5060

default['oversip']['sip']['listen_port_tls'] = 5061

default['oversip']['sip']['use_tls_tunnel'] = 'yes'

default['oversip']['sip']['listen_port_tls_tunnel'] = 5062

default['oversip']['sip']['callback_on_client_tls_handshake'] = 'yes'

default['oversip']['sip']['local_domains'] = []

default['oversip']['sip']['tcp_keepalive_interval'] = 300

default['oversip']['sip']['record_route_hostname_tls_ipv4'] = 'null'

default['oversip']['sip']['record_route_hostname_tls_ipv6'] = 'null'

##########################
#### WebSocket config ####
##########################
default['oversip']['websocket']['sip_ws'] = 'yes'

default['oversip']['websocket']['sip_wss'] = 'no'

default['oversip']['websocket']['enable_ipv4'] = 'yes'

default['oversip']['websocket']['listen_ipv4'] = 'null'

default['oversip']['websocket']['advertised_ipv4'] = 'null'

default['oversip']['websocket']['enable_ipv6'] = 'yes'

default['oversip']['websocket']['listen_ipv6'] = 'null'

default['oversip']['websocket']['advertised_ipv6'] = 'null'

default['oversip']['websocket']['listen_port'] = 10080

default['oversip']['websocket']['listen_port_tls'] = 10443

default['oversip']['websocket']['use_tls_tunnel'] = 'yes'

default['oversip']['websocket']['listen_port_tls_tunnel'] = 10444

default['oversip']['websocket']['callback_on_client_tls_handshake'] = 'yes'

default['oversip']['websocket']['max_ws_message_size'] = 65536

default['oversip']['websocket']['max_ws_frame_size'] = 65536

default['oversip']['websocket']['ws_keepalive_interval'] = 300

####################
#### TLS config ####
####################
default['oversip']['tls']['public_cert'] = 'null'

default['oversip']['tls']['private_cert'] = 'null'

default['oversip']['tls']['ca_dir'] = 'null'

######################
#### Proxy config ####
######################
default['oversip']['default_proxy']['do_record_routing'] = 'yes'

default['oversip']['default_proxy']['use_dns_cache'] = 'yes'

default['oversip']['default_proxy']['dns_cache_time'] = 300

default['oversip']['default_proxy']['use_blacklist'] = 'yes'

default['oversip']['default_proxy']['blacklist_time'] = 400

default['oversip']['default_proxy']['use_naptr'] = 'yes'

default['oversip']['default_proxy']['use_srv'] = 'yes'

default['oversip']['default_proxy']['transport_preference'] = ['tls', 'tcp', 'udp']

default['oversip']['default_proxy']['force_transport_preference'] = 'no'

default['oversip']['default_proxy']['ip_type_preference'] = ['ipv4', 'ipv6']

default['oversip']['default_proxy']['dns_failover_on_503'] = 'yes'

default['oversip']['default_proxy']['timer_B'] = 32

default['oversip']['default_proxy']['timer_C'] = 120

default['oversip']['default_proxy']['timer_F'] = 32

default['oversip']['default_proxy']['callback_on_server_tls_handshake'] = 'yes'

default['oversip']['proxies'] = []