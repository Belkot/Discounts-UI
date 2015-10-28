require 'rails_helper'

RSpec.describe RuleDiscountIfOneByMoresController, type: :controller do

  let(:valid_attributes) { FactoryGirl.attributes_for :rule_discount_if_one_by_more }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new RuleDiscountIfOneByMore" do
        expect {
          post :create, rule_discount_if_one_by_more: valid_attributes
        }.to change(RuleDiscountIfOneByMore, :count).by(1)
      end

      it "redirects to the constructor offers" do
        post :create, rule_discount_if_one_by_more: valid_attributes
        expect(response).to redirect_to offers_constructor_path
      end
    end

  end

  describe "DELETE #destroy" do
    it "destroys the requested rule_discount_if_one_by_more" do
      rule_discount_if_one_by_more = RuleDiscountIfOneByMore.create! valid_attributes
      expect {
        delete :destroy, id: rule_discount_if_one_by_more.to_param
      }.to change(RuleDiscountIfOneByMore, :count).by(-1)
    end

    it "redirects to the constructor offers" do
      rule_discount_if_one_by_more = RuleDiscountIfOneByMore.create! valid_attributes
      delete :destroy, id: rule_discount_if_one_by_more.to_param
      expect(response).to redirect_to offers_constructor_path
    end
  end

end
