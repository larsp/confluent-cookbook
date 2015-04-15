version = node.attribute['confluent']['version']

case node['platform_family']
when 'rhel'
    include_recipe 'yum'
    yum_repository 'confluent' do
        description "Confluent repository for #{version} packages"
        baseurl "http://packages.confluent.io/rpm/#{version}"
        gpgkey "http://packages.confluent.io/rpm/#{version}/archive.key"
        action :create
    end

when 'debian'
    apt_repository 'confluent' do
        uri "http://packages.confluent.io/deb/#{version}"
        components ['stable', 'main']
        arch 'all'
        key "http://packages.confluent.io/deb/#{version}/archive.key"
    end
end
