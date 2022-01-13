require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/10/posts' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the correct template' do
      expect(response).to render_template('posts/index')
    end
    it 'includes correct placeholder text' do
      expect(response.body).to include('This is the posts list page for the user 10')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/10/posts/20' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the correct template' do
      expect(response).to render_template('posts/show')
    end
    it 'includes correct placeholder text' do
      expect(response.body).to include('This is the detail page for the post 20 of the user 10')
    end
  end
end
