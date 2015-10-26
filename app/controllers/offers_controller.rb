require 'discounts'
class OffersController < ApplicationController
  def constructor
    Product.all.each do |product|
      inventory_product = Inventory::Product.new(code:  product.code,
                                                 name:  product.name,
                                                 price: product.price
                                                )
      Inventory.add inventory_product
    end
    @product = Product.new
    @products = Product.all

    @rule_by_one_get_one_free = RuleByOneGetOneFree.new
    @rule_by_one_get_one_frees = RuleByOneGetOneFree.all

    @rule_discount_if_one_by_more = RuleDiscountIfOneByMore.new
    @rule_discount_if_one_by_mores = RuleDiscountIfOneByMore.all
  end

  def tester
  end
end
