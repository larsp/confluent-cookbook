Vagrant.require_version '>= 1.5.0'

Vagrant.configure("2") do |config|
    config.vm.hostname = 'confluent-cookbook-image'
    config.omnibus.chef_version = 'latest'
    config.berkshelf.enabled = true
    config.vm.box = 'chef/centos-6.5'
    config.vm.network :private_network, type: 'dhcp'
    config.vm.network :forwarded_port, guest: 9092, host: 9092   # Kafka
    config.vm.network :forwarded_port, guest: 2181, host: 2181   # ZooKeeper

    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
    end

    config.vm.provision :chef_solo do |chef|
        chef.json = {
            :run_list => [
                "recipe[java]",
                "recipe[confluent]"
            ],
            :java => java_config
        }
    end
end


def java_config
    {
        :oracle => {
            :accept_oracle_download_terms => true
        },
        :oracle_rpm => {
            :type => "jdk",
        },
        :arch => "x86_64",
        :jdk_version => "8",
        :install_flavor => "oracle",
        :alternatives_priority => 20000
    }
end
