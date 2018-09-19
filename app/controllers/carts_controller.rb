# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
    @order = current_order
    @amount = @order.total_price
    @charge = @amount * 100
  end

  def destroy
    @order = current_order
    @order.order_items.destroy
    @order.destroy
    redirect_to products_path
  end

  def continue_checkout

  end
end
