version = node.attribute['confluent']['version']

case node['platform_family']
when 'rhel'
    include_recipe 'yum'
    yum_repository 'confluent' do
        description "Repository for #{version} of Confluent packages"
        baseurl node.attribute['confluent']['repository']['rpm']['url']
        gpgkey node.attribute['confluent']['repository']['rpm']['key']
        action :create
    end

when 'debian'
    apt_repository 'confluent' do
        uri node.attribute['confluent']['repository']['deb']['url']
        components ['stable', 'main']
        arch 'all'
        key node.attribute['confluent']['repository']['deb']['key']
    end
end
