template "/etc/init.d/zookeeper" do
    source "service.erb"
    owner 'confluent'
    group 'confluent'
    mode "755"
    variables({
        :name => "zookeeper",
        :process => "org.apache.zookeeper",
        :configuration => "zookeeper.properties",
        :start_script => "zookeeper-server-start"
        })
    notifies :restart, "service[zookeeper]"
end

template "/etc/init.d/kafka" do
    source "service.erb"
    owner 'confluent'
    group 'confluent'
    mode "755"
    variables({
        :name => "kafka",
        :process => "kafka.Kafka",
        :configuration => "server.properties",
        :start_script => "kafka-server-start"
        })
    notifies :restart, "service[kafka]"
end


service "kafka" do
    supports :restart => true, :status => true
    action [:enable, :start]
end

service "zookeeper" do
    supports :restart => true, :status => true
    action :enable
end
