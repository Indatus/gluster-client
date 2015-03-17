name             'gluster-client'
maintainer       'Indatus'
maintainer_email 'devops@indatus.com'
license          'Apache v2.0'
description      'Installs/Configures gluster-client'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'
depends		'apt'
depends		'yum'
supports 	'ubuntu' ">= 12.04"
supports	'centos' ">= 6.0"
supports	'scientific' ">= 6.0"
