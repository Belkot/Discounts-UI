require 'discounts'
class OffersController < ApplicationController
  before_action :set_inventory, only: [:constructor, :tester]

  def constructor
    @product = Product.new
    @products = Product.all

    @rule_by_one_get_one_free = RuleByOneGetOneFree.new
    @rule_by_one_get_one_frees = RuleByOneGetOneFree.all

    @rule_discount_if_one_by_more = RuleDiscountIfOneByMore.new
    @rule_discount_if_one_by_mores = RuleDiscountIfOneByMore.all
  end

  def tester
    @rule_by_one_get_one_frees = RuleByOneGetOneFree.all
    @rule_discount_if_one_by_mores = RuleDiscountIfOneByMore.all

    session[:rulebyonegetonefree_ids] ||= []
    session[:rulediscountifonebymore_ids] ||= []
    @rulebyonegetonefree_ids = session[:rulebyonegetonefree_ids]
    @rulediscountifonebymore_ids = session[:rulediscountifonebymore_ids]

    rule_byonegetonefrees = RuleByOneGetOneFree.where id: session[:rulebyonegetonefree_ids]
    rule_discountifonebymores = RuleDiscountIfOneByMore.where id: session[:rulediscountifonebymore_ids]

    rules = []
    rule_byonegetonefrees.each { |e| rules <<  Rule::ByOneGetOneFree.new(e.product_code) }
    rule_discountifonebymores.each { |e| rules <<  Rule::DiscountIfOneByeMore.new(product_code: e.product_code, min_count: e.min_count, discount: e.discount) }

    @co = Checkout.new(*rules)
    scan = session[:scan] || []
    scan.each { |code| @co.scan code }
    @total_price = @co.total
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

    def set_inventory
      Product.all.each do |product|
        Inventory.add Inventory::Product.new( code:  product.code,
                                              name:  product.name,
                                              price: product.price )
      end
    end

end
