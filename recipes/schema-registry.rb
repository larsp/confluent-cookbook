template "/etc/init.d/schema-registry" do
    source "service.erb"
    owner 'confluent'
    group 'confluent'
    mode "755"
    variables({
        :name => "schema-registry",
        :process => "io.confluent.kafka.schemaregistry.rest.Main",
        :configuration => "schema-registry.properties",
        :start_script => "schema-registry-start"
        })
    notifies :restart, "service[schema-registry]"
end

template "/etc/kafka/schema-registry.properties" do
    source "properties.erb"
    owner 'confluent'
    group 'confluent'
    mode '644'
    variables({:properties => node["confluent"]["kafka"]["schema-registry.properties"]})
    notifies :restart, "service[schema-registry]"
end

service "schema-registry" do
    supports :restart => true, :status => true
    action [:enable, :start]
end
