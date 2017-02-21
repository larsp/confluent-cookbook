template '/etc/kafka/server.properties' do
    source 'server.properties.erb'
    owner 'confluent'
    group 'confluent'
    mode '644'
    variables({:properties => node['confluent']['kafka']['server.properties']})
    notifies :restart, 'service[kafka]'
end

template '/usr/lib/systemd/system/kafka.service' do
    source 'kafka.service.erb'
    owner 'root'
    group 'root'
    mode '0644'
    variables({
                  :user => 'root',
                  :configuration => '/etc/kafka/server.properties',
                  :start_script => '/usr/bin/kafka-server-start',
                  :process => 'io.confluent.support.metrics.SupportedKafka',
                  :service_unit => node['confluent']['kafka']['service_unit']
              })
    notifies :restart, 'service[kafka]'
end

execute 'systemctl daemon-reload'

service 'kafka' do
    provider Chef::Provider::Service::Systemd
    supports :restart => true, :status => true
    action [:enable, :start]
end
