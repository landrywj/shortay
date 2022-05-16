require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:bookmark) { described_class.new }

  it 'requires a title and a link' do
    bookmark.valid?
    expect(bookmark.errors['title']).to eq(["can't be blank"])
    expect(bookmark.errors['link']).to include("can't be blank")
  end

  it 'requires link to a valid URI' do
    bookmark.link = 'httz://script.io'
    bookmark.valid?
    expect(bookmark.errors['link']).to include('is invalid')
  end

  it 'recognizes a valid URI for link attribute' do
    bookmark.title = 'My Website'
    bookmark.link = 'https://wilfrid.io'
    expect(bookmark.valid?).to be_truthy
  end

  it 'creates a secure random url safe slug if none is provided' do
    bookmark.title = 'E-comm website'
    bookmark.link = 'http://pipeline-e.com'
    bookmark.valid?
    expect(bookmark.shortay).not_to be_nil
    expect(bookmark.shortay.length).to eq(10)
  end
end
