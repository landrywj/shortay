require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:bookmark) { described_class.new }
  
  it 'requires a title and a link' do 
    bookmark.valid?
    expect(bookmark.errors['title']).to eq(["can't be blank"])
    expect(bookmark.errors['link']).to eq(["can't be blank"])
  end
end
