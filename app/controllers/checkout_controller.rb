require 'discounts'
class CheckoutController < ApplicationController

  def scan
    Product.all.each do |product|
    Inventory.add Inventory::Product.new(code:  product.code,
                                         name:  product.name,
                                         price: product.price
                                        )
    end
    # @product = Product.new
    # @products = Product.all

    # @rule_by_one_get_one_free = RuleByOneGetOneFree.new
    # @rule_by_one_get_one_frees = RuleByOneGetOneFree.all

    # @rule_discount_if_one_by_more = RuleDiscountIfOneByMore.new
    # @rule_discount_if_one_by_mores = RuleDiscountIfOneByMore.all
    
    scan = session[:scan] || []
    scan << params[:scan]

    # rulebyonegetonefree_ids
    # rulediscountifonebymore_ids

    redirect_to offers_tester_path
  end

  def new
    session[:scan] = []
    redirect_to offers_tester_path
  end

end
