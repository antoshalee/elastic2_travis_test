class Repository
  include Elasticsearch::Persistence::Repository

  index 'test_post_index'
  klass Post

  client Elasticsearch::Client.new(port: ES_PORT, host: ES_HOST)

  def serialize(post)
    {
      id: post.id,
      title: post.title,
      description: post.description
    }
  end
end
