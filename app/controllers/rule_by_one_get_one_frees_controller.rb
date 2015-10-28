class RuleByOneGetOneFreesController < ApplicationController

  def create
    RuleByOneGetOneFree.new(rule_by_one_get_one_free_params).save
    redirect_to offers_constructor_path
  end

  def destroy
    RuleByOneGetOneFree.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to offers_constructor_path }
      format.js { redirect_to offers_constructor_path, status: :see_other }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def rule_by_one_get_one_free_params
      params.require(:rule_by_one_get_one_free).permit(:product_code)
    end
end
