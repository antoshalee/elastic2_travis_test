require_relative '../environment'

require 'rake'
require 'elasticsearch/extensions'
require 'elasticsearch/extensions/test/cluster/tasks'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:each) do
    es_command = ENV['ES_COMMAND'] || 'elasticsearch'

    Elasticsearch::Extensions::Test::Cluster.start(
      nodes: 1,
      port: ES_PORT,
      path_logs: "tmp",
      path_work: "tmp",
      path_data: "tmp/elasticsearch_test",
      command: es_command
    ) unless Elasticsearch::Extensions::Test::Cluster.running?(on: ES_PORT)
  end

  config.after(:suite) do
    Elasticsearch::Extensions::Test::Cluster.stop(port: ES_PORT) if Elasticsearch::Extensions::Test::Cluster.running?(on: ES_PORT)
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
