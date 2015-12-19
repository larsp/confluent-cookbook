template "/etc/init.d/kafka-rest" do
    source "service.erb"
    owner 'confluent'
    group 'confluent'
    mode "755"
    variables({
        :name => "kafka-rest",
        :process => "io.confluent.kafkarest.KafkaRestMain",
        :configuration => "kafka-rest.properties",
        :start_script => "kafka-rest-start"
        })
    notifies :restart, "service[kafka-rest]"
end

template "/etc/kafka/kafka-rest.properties" do
    source "properties.erb"
    owner 'confluent'
    group 'confluent'
    mode '644'
    variables({:properties => node["confluent"]["kafka"]["kafka-rest.properties"]})
    notifies :restart, "service[kafka-rest]"
end

service "kafka-rest" do
    supports :restart => true, :status => true
    action [:enable, :start]
end
