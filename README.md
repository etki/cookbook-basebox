Basebox Cookbook
================

This cookbooks declares and/or installs shared dependencies for all basebox
child cookbooks: phantomjs, sqlite/mysql/postgresql, git, docker

Requirements
------------

Currently works on Ubuntu only (basebox itself supports Debian easily, but some
of dependency cookbooks not).

### Cookbooks

This cookbook refers to the following packages, as specified in metadata.rb:

- apt
- git
- nginx
- dnsmasq
- mysql (referred as dependency, use `node['basebox']['install_mysql']` to install)
- postgresql (only referred as dependency, use `node['basebox']['install_postgresql']` to install)
- sqlite (only referred as dependency, use `node['basebox']['install_sqlite']` to install)
- mysql2_chef_gem
- database
- redis (only referred as dependency, use `node['basebox']['install_redis']` to install)
- memcached (only referred as dependency, use `node['basebox']['install_memcached']` to install)
- gearman (only referred as dependency, use `node['basebox']['install_gearman']` to install)
- phantomjs
- docker
- allure-cli (custom cookbook)

Attributes
----------

| Attribute             | Value   | Default value | Note                                 |
|-----------------------|---------|---------------|--------------------------------------|
| `install_git`         | boolean | `true`        | Whether to install git               |
| `install_nginx`       | boolean | `true`        | Whether to install Nginx             |
| `configure_nginx`     | boolean | `true`        | Whether to run `nginx_conf` coolbook |
| `install_dnsmasq`     | boolean | `true`        | Whether to install DNSMasq           |
| `install_mysql`       | boolean | `false`       | Whether to install MySQL             |
| `mysql_root_password` | string  | `'root'`      | Password for MySQL `root` account    |
| `expose_mysql`        | boolean | `true`        | If set to true, MySQL will be accessible from outside |
| `mysql_users`         | hash    | empty hash    | A hash of users in {login => password} form, no superprivileges |
| `install_postgresql`  | boolean | `false`       | Whether to install PostgreSQL        |
| `postgresql_users`    | hash    | empty hash    | A hash of users in {login => password} form, no superprivileges |
| `install_sqlite`      | boolean | `false`       | Whether to install SQLite            |
| `install_redis`       | boolean | `false`       | Whether to install Redis             |
| `install_memcached`   | boolean | `false`       | Whether to install Memcached         |
| `install_gearman`     | boolean | `false`       | Whether to install Gearman           |
| `install_docker`      | boolean | `true`        | Whether to install Docker            |
| `install_phantomjs`   | boolean | `true`        | Whether to install PhantomJS         |
| `install_allure_cli`  | boolean | `true`        | Whether to install Allure CLI runner |

Usage
-----
#### basebox::default

Simply runs `basebox::install`

#### basebox::install

Installs all dependecies required by child baseboxes. Usually this recipe isn't
used explicitly as it is run by a child basebox recipe.

Known issues
------------

* PostgreSQL installation doesn't work yet.
* Users hash structure is subject to change.

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

License: MIT  
Authors: Etki
