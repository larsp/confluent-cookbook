include_recipe 'confluent-cookbook::_repositories'

# installing things
package "confluent-platform-oss-#{node.attribute['confluent']['scala_version']}"

include_recipe 'confluent-cookbook::_user'
