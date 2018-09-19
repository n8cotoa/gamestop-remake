class OrdersController < ApplicationController
  def history
    @orders = current_user.orders
  end
end
