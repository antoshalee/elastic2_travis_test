require 'elasticsearch'
require 'elasticsearch/persistence'

class Repository
  include Elasticsearch::Persistence::Repository

  index 'test_post_index'
  klass Post

  client Elasticsearch::Client.new

  def serialize(post)
    {
      id: post.id,
      title: post.title,
      description: post.description
    }
  end
end
