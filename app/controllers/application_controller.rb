# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if current_user
      if Order.find_by('user_id = ?', current_user.id) != nil
        Order.find_by('user_id = ?', current_user.id)
      else
        Order.new
      end
    elsif session[:order_id]
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
