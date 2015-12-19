template "/etc/init.d/kafka-schema-registry" do
    source "service.erb"
    owner 'confluent'
    group 'confluent'
    mode "755"
    variables({
        :name => "kafka-schema-registry",
        :process => "io.confluent.kafka.schemaregistry.rest.SchemaRegistryMain",
        :configuration => "schema-registry.properties",
        :start_script => "schema-registry-start"
        })
    notifies :restart, "service[kafka-schema-registry]"
end

template "/etc/kafka/schema-registry.properties" do
    source "properties.erb"
    owner 'confluent'
    group 'confluent'
    mode '644'
    variables({:properties => node["confluent"]["kafka"]["schema-registry.properties"]})
    notifies :restart, "service[kafka-schema-registry]"
end

service "kafka-schema-registry" do
    supports :restart => true, :status => true
    action [:enable, :start]
end
