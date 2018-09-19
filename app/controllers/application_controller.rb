# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if current_user
      order = current_user.orders.last
      if order != nil && order.status != 'Paid'
        order
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
