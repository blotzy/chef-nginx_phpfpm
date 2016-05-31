default['php']['version'] = '7.0.6'
default['php']['checksum'] = 'f6b47cb3e02530d96787ae5c7888aefbd1db6ae4164d68b88808ee6f4da94277' # tied to 7.0.6
default[:php][:fpm][:conf] = "#{node[:php][:conf_dir]}/php-fpm.conf"
default[:php][:fpm][:directives] = {}
default[:php][:fpm][:timeout] = 30
default[:php][:opcache][:memory_consumption] = 256
default[:php][:opcache][:interned_strings_buffer] = 64
default[:php][:opcache][:max_wasted_percentage] = 1
default[:php][:opcache][:enable_cli] = 0
default[:php][:opcache][:max_accelerated_files] = 99999 # opcache will use 130987 for values in between 65407-130987
default[:php][:opcache][:revalidate_freq] = 0
default[:php][:fpm][:socket] = 128
default[:php][:fpm][:max_children] = 128
default[:php][:fpm][:start_servers] = 24
default[:php][:fpm][:min_spare_servers] = 16
default[:php][:fpm][:max_spare_servers] = 32
default[:php][:fpm][:max_requests] = 2048
default[:php][:fpm][:emergency_restart_threshold] = 0
default[:php][:fpm][:emergency_restart_interval] = 0
default['php']['configure_options'] = %W{--prefix=#{php['prefix_dir']}
                                         --with-libdir=lib
                                         --with-config-file-path=#{php['conf_dir']}
                                         --with-config-file-scan-dir=#{php['ext_conf_dir']}
                                         --with-pear
                                         --enable-fpm
                                         --with-fpm-user=#{php['fpm_user']}
                                         --with-fpm-group=#{php['fpm_group']}
                                         --enable-opcache
                                         --enable-pcntl
                                         --enable-bcmath
                                         --with-zlib
                                         --with-openssl
                                         --with-kerberos
                                         --with-bz2
                                         --with-curl
                                         --enable-ftp
                                         --enable-zip
                                         --enable-exif
                                         --with-gd
                                         --enable-gd-native-ttf
                                         --with-gettext
                                         --with-gmp
                                         --with-mhash
                                         --with-iconv
                                         --with-imap
                                         --with-imap-ssl
                                         --enable-sockets
                                         --enable-soap
                                         --with-xmlrpc
                                         --with-mcrypt
                                         --enable-mbstring
                                         --with-mysqli=mysqlnd
                                         --with-sqlite3
                                         --with-pdo-mysql=mysqlnd
                                         --with-pdo-sqlite
                                         --with-pdo-odbc=unixODBC,/usr/}

