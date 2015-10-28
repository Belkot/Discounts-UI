require 'rails_helper'

RSpec.describe CheckoutController, type: :controller do

  describe "POST #scan" do
    it "returns http success" do
      post :scan
      expect(response).to have_http_status :redirect
    end

    it "redirects to the tester offers" do
      post :scan
      expect(response).to redirect_to offers_tester_path
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status :redirect
    end

    it "redirects to the tester offers" do
      get :new
      expect(session[:scan]).to be_nil
      expect(response).to have_http_status :redirect
    end
  end

end
