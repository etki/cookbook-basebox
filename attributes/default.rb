override['apt']['compiletime'] = true
override['apt']['compile_time_update'] = true
override['postgres']['initdb_locale'] = 'en_US.UTF-8'
override['docker']['package']['repo_url'] = 'https://get.docker.com/ubuntu'
#override['docker']['package']['repo_key'] = '36A1D7869245C8950F966E92D8576A8BA88D21E9'

default['basebox']['configure_locale'] = true

default['basebox']['install_git'] = true

default['basebox']['install_nginx'] = true

default['basebox']['configure_nginx'] = true

default['basebox']['install_dnsmasq'] = true
default['basebox']['install_dnsmasq'] = false

default['basebox']['install_mysql'] = false
default['basebox']['mysql_root_password'] = 'root'
default['basebox']['expose_mysql'] = true
default['basebox']['mysql_users'] = {}
default['basebox']['mysql_databases'] = {}

default['basebox']['install_postgresql'] = false
default['basebox']['postgresql_users'] = {}
default['basebox']['postgresql_databases'] = {}

default['basebox']['install_sqlite'] = false

default['basebox']['install_redis'] = false

default['basebox']['install_memcached'] = false

default['basebox']['install_gearman'] = false

default['basebox']['install_docker'] = node['kernel']['machine'] == 'x86_64'

default['basebox']['install_phantomjs'] = true

default['basebox']['install_allure_cli'] = true