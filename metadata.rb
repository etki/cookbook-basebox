name             'basebox'
maintainer       'Etki'
maintainer_email 'etki@etki.name'
license          'MIT'
description      'Installs and configures shared Basebox components'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'apt', '~> 2.7.0'
depends 'git', '~> 4.1.0'
depends 'nginx', '~> 2.7.6'
depends 'nginx_conf', '~> 0.0.5'
depends 'dnsmasq', '~> 0.2.0'
depends 'mysql', '~> 6.0'
depends 'postgresql', '~> 3.4.18'
depends 'sqlite', '~> 1.1.0'
depends 'mysql2_chef_gem', '~> 1.0'
depends 'database', '~> 4.0.3'
depends 'redis', '~> 3.0.4'
depends 'memcached', '~> 1.7.2'
depends 'gearman', '~> 0.0.1'
depends 'docker', '~> 0.36.0'
depends 'phantomjs', '~> 1.0.3'
depends 'allure-cli', '~> 0.1.0'
depends 'monit-ng', '~> 1.6.1'

%w{ubuntu}.each do |os|
  supports os
end