class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def redirect_to_offers_constructor
    respond_to do |format|
      format.html { redirect_to offers_constructor_path }
      format.js { redirect_to offers_constructor_path, status: :see_other }
    end
  end
end
