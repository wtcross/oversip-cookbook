case node['oversip']['install_method']
when 'package'
  include_recipe 'oversip::package'
when 'tarball'
  include_recipe 'oversip::tarball'
end

service node['oversip']['service']

config_dir = node['oversip']['config_dir']
config_file = node['oversip']['config_file']

cookbook_file 'server.rb' do
  path "#{node['oversip']['config_dir']}/server.rb"
  owner node['oversip']['user']
  group node['oversip']['group']
  action :create_if_missing
  mode 0644
end

template "#{config_dir}/#{config_file}" do
  source 'oversip.conf.erb'
  owner node['oversip']['user']
  group node['oversip']['group']
  variables({
    core_conf: node['oversip']['core'],
    sip_conf: node['oversip']['sip'],
    ws_conf: node['oversip']['websocket'],
    tls_conf: node['oversip']['tls']
  })
  action :create
  mode 0644
end

template "#{config_dir}/proxies.conf" do
  source 'proxies.conf.erb'
  owner node['oversip']['user']
  group node['oversip']['group']
  action :create
  mode 0644
end

template "/etc/default/oversip" do
  source 'oversip.default.erb'
  owner 'root'
  group 'root'
  action :create
  mode 0644
  notifies :restart, "service[#{node['oversip']['service']}]"
end
