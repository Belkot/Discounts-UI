class RuleDiscountIfOneByMoresController < ApplicationController

  def create
    RuleDiscountIfOneByMore.new(rule_discount_if_one_by_more_params).save
    redirect_to offers_constructor_path
  end

  def destroy
    RuleDiscountIfOneByMore.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to offers_constructor_path }
      format.js { redirect_to offers_constructor_path, status: :see_other }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def rule_discount_if_one_by_more_params
      params.require(:rule_discount_if_one_by_more).permit(:product_code, :min_count, :discount)
    end
end
