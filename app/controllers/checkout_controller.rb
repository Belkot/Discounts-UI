require 'discounts'
class CheckoutController < ApplicationController

  def scan
    Product.all.each do |product|
      Inventory.add Inventory::Product.new( code:  product.code,
                                            name:  product.name,
                                            price: product.price )
    end

    session[:scan] ||= []
    session[:scan] << params[:scan]

    session[:rulebyonegetonefree_ids] ||= []
    session[:rulediscountifonebymore_ids] ||= []

    session[:rulebyonegetonefree_ids] = params[:rulebyonegetonefree_ids]
    session[:rulediscountifonebymore_ids] = params[:rulediscountifonebymore_ids]

    @rulebyonegetonefree_ids = session[:rulebyonegetonefree_ids]
    @rulediscountifonebymore_ids = session[:rulediscountifonebymore_ids]

    respond_to do |format|
      format.html { redirect_to offers_tester_path }
      format.js { redirect_to offers_tester_path  }
    end

  end

  def new
    session[:scan] = nil
    redirect_to offers_tester_path
  end

end
