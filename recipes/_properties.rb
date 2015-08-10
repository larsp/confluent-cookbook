template "/etc/kafka/zookeeper.properties" do
    source "properties.erb"
    owner 'confluent'
    group 'confluent'
    mode '644'
    variables({:properties => node["confluent"]["kafka"]["zookeeper.properties"]})
    notifies :restart, "service[zookeeper]"
end

template "/etc/kafka/server.properties" do
    source "properties.erb"
    owner 'confluent'
    group 'confluent'
    mode '644'
    variables({:properties => node["confluent"]["kafka"]["server.properties"]})
    notifies :restart, "service[kafka]"
end