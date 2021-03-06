require 'rails_helper'

RSpec.describe ErrorsController, :type => :controller do

  before(:each) do
    expect(controller).to receive(:authenticate_user!).and_return(User.create({password:"password"}))
  end

  describe "GET #not_found" do
    it "returns http success" do
      get :not_found
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "GET #internal_server_error" do
    it "returns http success" do
      get :internal_server_error
      expect(response).to have_http_status(:internal_server_error)
    end
  end

end
