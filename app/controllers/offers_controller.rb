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

  end

  def tester
  end
end
