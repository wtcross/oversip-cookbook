case node['platform']
when 'ubuntu', 'debian'
  apt_repository 'oversip' do
    uri node['oversip']['package']['repo']['url']
    distribution node['oversip']['package']['repo']['distro']
    components node['oversip']['package']['repo']['components']
    key node['oversip']['package']['repo']['key']
    only_if { node['oversip']['package']['repo']['enable'] }
  end

  package node['oversip']['package']['name']

  oversip_user = node['oversip']['user']
  oversip_group = node['oversip']['group']
  home_directory = "/home/#{oversip_user}"

  user oversip_user do
    shell '/bin/bash'
    home home_directory
  end

  group oversip_group do
    members oversip_user
  end

  directory node['oversip']['config_dir'] do
    owner node['oversip']['user']
    group node['oversip']['group']
  end
else
  raise "Platform #{node['platform']} not supported by package recipe. Try tarball."
end