include_recipe 'confluent::_repositories'

# installing things
package "confluent-platform-#{node.attribute['confluent']['scala_version']}"

include_recipe 'confluent::_user'
include_recipe 'confluent::_properties'
include_recipe 'confluent::_services'
