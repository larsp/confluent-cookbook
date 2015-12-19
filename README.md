# confluent.io Cookbook
This cookbook is using the confluent `rpm` and `deb` repositories to install the `confluent-platform` v2 packages. It will create a user `confluent` and init scripts for `kafka` `zookeeper`, `schema-registry` and `kafka-rest`.  

## Recipe
It comes with multiple recipes: `confluent-cookbook::default`, `confluent-cookbook::zookeeper`,`confluent-cookbook::kafka` `confluent-cookbook::kafka-schema-registry` and `confluent-cookbook::kafka-rest`.

## Configuration
Instead of maintaining configuration templates, chef configuration properties will be added as `server.properties`, `zookeeper.properties` , `schema-registry.properties` and `kafka-rest.properties` files.

Example Kafka:
```ruby
default["confluent"]["kafka"]["server.properties"]["broker.id"] = "0"
default["confluent"]["kafka"]["server.properties"]["port"] = "9092"
...
```
will look like this in the `/etc/kafka/server.properties`
```
broker.id=0
port=9092
...
```

Example ZooKeeper:
```ruby
default["confluent"]["kafka"]["zookeeper.properties"]["dataDir"] = "/tmp/zookeeper"
default["confluent"]["kafka"]["zookeeper.properties"]["clientPort"] = "2181"
...
```

will look like this in the `/etc/kafka/zookeeper.properties`
```
dataDir=/tmp/zookeeper
clientPort=2181
...
```

## Other `confluent-platform` configurations
Right now Kafka, ZooKeeper, the Schema-Registry and Kafka-REST can be configured.

## Vagrant
In order to be able to run vagrant you need to run `berks init` and you have to install `vagrant-berkshelf` via `vagrant plugin install vagrant-berkshelf`. Afterwards run `vagrant up`.

## Supported OS Distributions
Right now it has been tested with:
 - CentOS 7.x
 - Ubuntu 14.04 (where it seems to hang sometimes during installation)

## JRE
You need to install your desired JRE yourself, see `Vagrantfile` as an example.

## Build
At some point this project might have a travis build job.
