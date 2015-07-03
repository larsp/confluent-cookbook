Vagrant.require_version '>= 1.5.0'

Vagrant.configure("2") do |config|
    config.vm.hostname = 'confluent-cookbook-image'
    config.omnibus.chef_version = 'latest'
    config.berkshelf.enabled = true
    #config.vm.box = 'chef/centos-6.5'
    config.vm.box = 'chef/ubuntu-14.04'
    config.vm.network :private_network, type: 'dhcp'
    config.vm.network :forwarded_port, guest: 9092, host: 9092   # Kafka
    config.vm.network :forwarded_port, guest: 2181, host: 2181   # ZooKeeper
    config.vm.network :forwarded_port, guest: 8081, host: 8081   # Schema Registry


    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
    end

    config.vm.provision :chef_solo do |chef|
        chef.json = {
            :run_list => [
                "recipe[apt]",
                "recipe[java]",
                "recipe[confluent-cookbook]",
                "recipe[confluent-cookbook::schema-registry]"
            ],
            :java => {
                :jdk_version => "7",
                :install_flavor => "openjdk",
            },
            :confluent => {
                :kafka => {
                    "server.properties" => {
                        "advertised.host.name" => "localhost",
                        "log.cleaner.enable" => "true"
                    }
                }
            }
        }
    end
end
