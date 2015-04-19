name             'confluent'
maintainer       'Lars Pfannenschmidt'
maintainer_email 'lars@mobilecologne.de'
license          'Apache License Version 2.0'
description      'Installs/Configures confluent'
long_description 'Installs/Configures confluent'
version          '0.1.0'

depends 'java'
depends 'apt'
depends 'yum'

%w(ubuntu centos redhat fedora amazon).each do |os|
  supports os
end