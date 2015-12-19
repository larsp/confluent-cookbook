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

template "/etc/kafka/zookeeper.properties" do
    source "properties.erb"
    owner 'confluent'
    group 'confluent'
    mode '644'
    variables({:properties => node["confluent"]["kafka"]["zookeeper.properties"]})
    notifies :restart, "service[zookeeper]"
end

service "zookeeper" do
    supports :restart => true, :status => true
    action [:enable, :start]
end
