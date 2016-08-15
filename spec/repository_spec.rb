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

  it 'searches' do
    index_post

    described_class.refresh_index!
    expect(described_class.search({}).response.hits.hits.size).to eq 1
  end
end
