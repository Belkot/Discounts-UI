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

    # @checkout = Checkout.new()
  end

  private

    def set_inventory
      Product.all.each do |product|
      Inventory.add Inventory::Product.new(code:  product.code,
                                           name:  product.name,
                                           price: product.price
                                          )
      end
    end

end
