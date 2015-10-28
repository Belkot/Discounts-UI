require 'rails_helper'

RSpec.describe RuleByOneGetOneFreesController, type: :controller do

  let(:valid_attributes) { FactoryGirl.attributes_for :rule_by_one_get_one_free }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new RuleByOneGetOneFree" do
        expect {
          post :create, rule_by_one_get_one_free: valid_attributes
        }.to change(RuleByOneGetOneFree, :count).by(1)
      end

      it "redirects to the constructor offers" do
        post :create, rule_by_one_get_one_free: valid_attributes
        expect(response).to redirect_to offers_constructor_path
      end
    end

  end

  describe "DELETE #destroy" do
    it "destroys the requested rule_by_one_get_one_free" do
      rule_by_one_get_one_free = RuleByOneGetOneFree.create! valid_attributes
      expect {
        delete :destroy, id: rule_by_one_get_one_free.to_param
      }.to change(RuleByOneGetOneFree, :count).by(-1)
    end

    it "redirects to the constructor offers" do
      rule_by_one_get_one_free = RuleByOneGetOneFree.create! valid_attributes
      delete :destroy, id: rule_by_one_get_one_free.to_param
      expect(response).to redirect_to offers_constructor_path
    end
  end

end
