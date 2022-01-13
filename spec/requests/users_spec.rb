require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    before(:example) { get users_path }
    it "is a success" do
      expect(response).to have_http_status(:ok)
    end
    it "renders the correct template" do
      expect(response).to render_template('users/index')
    end
    it "includes correct placeholder text" do
      expect(response.body).to include("This is the main page with a list of users")
    end
  end

  describe "GET /show" do
    before(:example) { get "/users/10" }
    it "is a success" do
      expect(response).to have_http_status(:ok)
    end
    it "renders the correct template" do
      expect(response).to render_template('users/show')
    end
    it "includes correct placeholder text" do
      expect(response.body).to include("This is the detail page for the user 10")
    end
  end
end
