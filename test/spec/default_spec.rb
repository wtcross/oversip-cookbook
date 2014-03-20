require 'chefspec'
require 'chefspec/berkshelf'

describe 'oversip::default' do

	USER = 'oversip'
	GROUP = 'oversip'
	CONFIG_DIR = '/etc/oversip'
	PROXY_CONFIG_FILE = 'proxies.conf'
	PROXY_CONFIG_PATH = "#{CONFIG_DIR}/#{PROXY_CONFIG_FILE}"
	MAIN_CONFIG_FILE = 'oversip.conf'
	MAIN_CONFIG_PATH = "#{CONFIG_DIR}/#{MAIN_CONFIG_FILE}"

	def validate_config (file, patterns)
		if not patterns.kind_of?(Array)
			patterns = [ patterns ]
		end

		patterns.each do |content|
			expect(chef_run).to render_file(file).with_content(content)
		end
	end

	context 'on Debian 7.4' do

		platform = 'debian'
		version = '7.4'

		context 'using the default attributes' do

			let(:chef_run) do
				ChefSpec::Runner.new(platform: platform, version: version).converge(described_recipe)
			end

			it 'installs OverSIP from a package' do
				expect(chef_run).to include_recipe('oversip::package')
				expect(chef_run).to install_package('oversip')
			end

			it 'creates a `oversip` user' do
				expect(chef_run).to create_user(USER)
			end

			it 'creates a `oversip` group' do
				expect(chef_run).to create_group(GROUP).with(
					members: [ USER ]
				)
			end

			it 'creates the configuration directory' do
				expect(chef_run).to create_directory(CONFIG_DIR).with(
					owner: USER,
					group: GROUP
				)
			end

			it 'creates default `server.rb` to the config directory' do
				expect(chef_run).to render_file("#{CONFIG_DIR}/server.rb")
			end

			it 'creates the `oversip.conf` configuration file' do
				validate_config(MAIN_CONFIG_PATH, [
					'nameservers: null',
					'syslog_facility: daemon',
					'syslog_level: debug',
					'sip_udp: yes',
					'sip_tcp: yes',
					'sip_tls: no',
					'enable_ipv4: yes',
					'listen_ipv4: null',
					'advertised_ipv4: null',
					'enable_ipv6: yes',
					'listen_ipv6: null',
					'advertised_ipv6: null',
					'listen_port: 5060',
					'listen_port_tls: 5061',
					'use_tls_tunnel: yes',
					'listen_port_tls_tunnel: 5062',
					'callback_on_client_tls_handshake: yes',
					'local_domains: null',
					'tcp_keepalive_interval: 300',
					'record_route_hostname_tls_ipv4: null',
					'record_route_hostname_tls_ipv6: null',
					'sip_ws: yes',
					'sip_wss: no',
					'enable_ipv4: yes',
					'listen_ipv4: null',
					'advertised_ipv4: null',
					'enable_ipv6: yes',
					'listen_ipv6: null',
					'advertised_ipv6: null',
					'listen_port: 10080',
					'listen_port_tls: 10443',
					'use_tls_tunnel: yes',
					'listen_port_tls_tunnel: 10444',
					'callback_on_client_tls_handshake: yes',
					'max_ws_message_size: 65536',
					'max_ws_frame_size: 65536',
					'ws_keepalive_interval: 300',
					'public_cert: null',
					'private_cert: null',
					'ca_dir: null'
				])
			end

			it 'creates the `proxies.conf` configuration file' do
				validate_config(PROXY_CONFIG_PATH, [
					'do_record_routing: yes',
					'use_dns_cache: yes',
					'dns_cache_time: 300',
					'use_blacklist: yes',
					'blacklist_time: 400',
					'use_naptr: yes',
					'use_srv: yes',
					'transport_preference: [tls, tcp, udp]',
					'force_transport_preference: no',
					'ip_type_preference: [ipv4, ipv6]',
					'dns_failover_on_503: yes',
					'timer_B: 32',
					'timer_C: 120',
					'timer_F: 32',
					'callback_on_server_tls_handshake: yes'
				])
			end

			it 'creates the `/etc/default/oversip` configuration file and starts OverSIP' do
				default_config = '/etc/default/oversip'
				service_name = 'oversip'

				validate_config(default_config, [
					'RUN=yes',
					"USER=#{USER}",
					"GROUP=#{GROUP}"
				])

				template = chef_run.template(default_config)

				expect(template).to notify("service[#{service_name}]").to(:restart)

				expect(chef_run).to enable_service(service_name)
			end

		end

	end

end