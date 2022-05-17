# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/bookmarks', type: :request do
  fixtures :bookmarks

  let(:valid_headers) do
    { 'ACCEPT' => 'application/json' }
  end
  let(:valid_attributes) do
    { title: 'My Bookmark', link: 'https://helloworld.com/random' }
  end

  let(:invalid_attributes) do
    { title: 'Bad Request Bookmark', link: 'httpz://script.gotcha!' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get bookmarks_path(format: :json), headers: valid_headers
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      bookmark = bookmarks(:slugged)
      get bookmark_url(id: bookmark.id, format: :json), headers: valid_headers
      expect(response).to be_successful
    end
  end

  describe 'GET /refer' do 
    it 'redirects to the referenced link' do 
      bookmark = bookmarks(:slugged)
      get "/#{bookmark.shortay}"
      expect(response).to redirect_to(bookmark.link)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_bookmark_path
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      bookmark = Bookmark.create!(valid_attributes)
      get edit_bookmark_url(bookmark)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Bookmark' do
        post '/bookmarks.json', params: valid_attributes, headers: valid_headers
        expect(response).to have_http_status(:created)
      end

      it 'redirects to the created bookmark' do
        post bookmarks_url, params: valid_attributes
        expect(response).to redirect_to(bookmark_url(Bookmark.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Bookmark' do
        expect do
          post bookmarks_url, params: invalid_attributes
        end.to change(Bookmark, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post bookmarks_url(format: :json), params: invalid_attributes, headers: valid_headers
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it 'updates the requested bookmark' do
        bookmark = Bookmark.create!(title: 'A New Bookmark', link: 'https://helloworld.com/hello')
        patch "/bookmarks/#{bookmark.id}.json", params: { title: 'Bookmarkie Mark' }, headers: valid_headers
        bookmark.reload
        expect(bookmark.title).to eq('Bookmarkie Mark')
      end
    end

    context 'with invalid parameters' do
      it 'renders a unprocessable entity response' do
        bookmark = Bookmark.create! valid_attributes
        patch bookmark_url(bookmark), params: invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested bookmark' do
      bookmark = Bookmark.create!(title: 'Hello Bookmark', link: 'https://netscape.net/helloworld.html')
      delete "/bookmarks/#{bookmark.id}.json"
      expect(response).to have_http_status(:no_content)
    end

    it 'redirects to the bookmarks list' do
      bookmark = bookmarks(:slugged)
      delete bookmark_url(id: bookmark.id)
      expect(response).to redirect_to(bookmarks_url)
    end
  end
end
