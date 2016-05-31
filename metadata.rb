name             'nginx_phpfpm'
maintainer       'Richard Acosta'
maintainer_email 'richard@opsclock.com'
license          'All rights reserved'
description      'Installs/Configures nginx and php-fpm'
long_description 'Installs/Configures nginx and php-fpm'
version          '0.1.0'

depends 'apt'

depends 'php', '~> 1.9.0'
depends 'nginx', '~> 2.7.6'
