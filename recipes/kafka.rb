template "/etc/init.d/kafka" do
    source "service.erb"
    owner 'confluent'
    group 'confluent'
    mode "755"
    variables({
        :name => "kafka",
        :process => "io.confluent.support.metrics.SupportedKafka",
        :configuration => "server.properties",
        :start_script => "kafka-server-start"
        })
    notifies :restart, "service[kafka]"
end

template "/etc/kafka/server.properties" do
    source "properties.erb"
    owner 'confluent'
    group 'confluent'
    mode '644'
    variables({:properties => node["confluent"]["kafka"]["server.properties"]})
    notifies :restart, "service[kafka]"
end

service "kafka" do
    supports :restart => true, :status => true
    action [:enable, :start]
end
