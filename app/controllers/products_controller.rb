class ProductsController < ApplicationController

  def create
    Product.new(product_params).save
    redirect_to offers_constructor_path
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to_offers_constructor
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:code, :name, :price)
    end
end
