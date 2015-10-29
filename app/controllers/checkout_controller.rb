require 'discounts'
class CheckoutController < ApplicationController

  def scan
    session[:scan] ||= []
    session[:scan] << params[:scan]

    session[:rulebyonegetonefree_ids] = params[:rulebyonegetonefree_ids] || []
    session[:rulediscountifonebymore_ids] = params[:rulediscountifonebymore_ids] || []

    redirect_to offers_tester_path
  end

  def new
    session[:scan] = nil
    redirect_to offers_tester_path
  end

end
