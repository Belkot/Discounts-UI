require 'rails_helper'

RSpec.describe OffersController, type: :controller do

  describe "GET #constructor" do
    it "returns http success" do
      get :constructor
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #tester" do
    it "returns http success" do
      get :tester
      expect(response).to have_http_status(:success)
    end
  end

end
