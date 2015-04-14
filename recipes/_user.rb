group 'confluent' do
    system true
    action :create
end

user 'confluent' do
    comment 'Confluent Server user'
    gid 'confluent'
    system true
    shell '/bin/bash'
    action :create
end

group 'confluent' do
    members ['confluent']
    append true
    action :modify
end

directory '/var/log/kafka' do
    owner 'confluent'
    group 'confluent'
    recursive true
    action :create
end
