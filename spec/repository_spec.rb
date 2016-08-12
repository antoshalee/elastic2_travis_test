require 'spec_helper'

describe Repository do
  def index_post
    described_class.create_index! force: true

    post = Post.new
    post.id = 1
    post.title = 'Title'
    post.description = 'Description'

    described_class.save(post)
  end

  it 'has connection' do
    expect { index_post }.not_to raise_error
  end
end
