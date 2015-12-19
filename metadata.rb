name             'confluent-cookbook'
maintainer       'Lars Pfannenschmidt'
maintainer_email 'lars@mobilecologne.de'
license          'Apache License Version 2.0'
description      'Installs/Configures confluent.io platform from rpm/deb packages'
long_description 'Installs/Configures confluent.io platform from rpm/deb packages'
version          '0.4.0'

depends 'java'
depends 'apt'
depends 'yum'

%w(ubuntu centos redhat fedora amazon).each do |os|
  supports os
end
