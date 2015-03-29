#
# Cookbook Name:: basebox
# Recipe:: default
#
# Copyright 2015, Etki
#

if %w{ubuntu debian}.include? node['platform']
  package 'iotop'
end

include_recipe 'git' if node['basebox']['install_git']

if node['basebox']['install_nginx']
  include_recipe 'nginx'
  include_recipe 'nginx_conf' if node['basebox']['configure_nginx']
end

include_recipe 'dnsmasq' if node['basebox']['install_dnsmasq']

if node['basebox']['install_mysql']
  address = '0.0.0.0' if node['basebox']['expose_mysql'] else '127.0.0.1'
  mysql_service 'default' do
    bind_address node['basebox']['expose_mysql'] ? '0.0.0.0' : '127.0.0.1'
    initial_root_password node['basebox']['mysql_root_password']
    action [:create, :start]
  end
  if not node['basebox']['mysql_users'].empty? or not node['basebox']['mysql_databases'].empty?
    mysql2_chef_gem 'default' do
      action :install
    end
    mysql_connection_info = {
        :host => '127.0.0.1',
        :username => 'root',
        :password => node['basebox']['mysql_root_password']
    }
    node['basebox']['mysql_databases'].keys.each do |name|
      mysql_database name do
        connection mysql_connection_info
        action :create
      end
    end
    node['basebox']['mysql_users'].each do |user, password|
      mysql_user user do
        connection mysql_connection_info
        password password
        action :create
      end
      node['basebox']['mysql_databases'].each do |name, details|
        if details['grants'].include? user
          mysql_user user do
            database_name name
            action :grant
          end
        end
      end
    end
  end
end

if node['basebox']['install_postgresql']

end

include_recipe 'sqlite' if node['basebox']['install_sqlite']

include_recipe 'redis' if node['basebox']['install_redis']
include_recipe 'memcached' if node['basebox']['install_memcached']
include_recipe 'gearman' if node['basebox']['install_gearman']
include_recipe 'docker' if node['basebox']['install_docker']
include_recipe 'phantomjs' if node['basebox']['install_phantomjs']
include_recipe 'allure-cli' if node['basebox']['install_allure_cli']

