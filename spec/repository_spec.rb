require 'spec_helper'

describe Repository do
  before do
    described_class.create_index! force: true
  end

  it 'works' do
    post = Post.new
    post.id = 1
    post.title = 'Title'
    post.description = 'Description'

    described_class.save(post)
  end
end
