require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  let(:valid_attributes) { FactoryGirl.attributes_for :product }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, product: valid_attributes
        }.to change(Product, :count).by(1)
      end

      it "redirects to the constructor offers" do
        post :create, product: valid_attributes
        expect(response).to redirect_to offers_constructor_path
      end
    end

  end

  describe "DELETE #destroy" do
    it "destroys the requested product" do
      product = Product.create! valid_attributes
      expect {
        delete :destroy, id: product.to_param
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the constructor offers" do
      product = Product.create! valid_attributes
      delete :destroy, id: product.to_param
      expect(response).to redirect_to offers_constructor_path
    end
  end

end
