#
# Cookbook:: apache2
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
apt_update 'Update the apt cache daily' do
    frequency 86_400
    action :periodic
end

package node['apache2']['package']

cookbook_file "#{node['apache2']['docroot']}/index.html" do
    source 'index.html'
    action :create
end

service node['apache2']['service'] do
    supports status: true, restart: true, reload: true
    action %i(enable start)
end