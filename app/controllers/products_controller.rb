# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def update
    product = Product.find(params[:product][:product_id])
    if current_user.products.include?(product)
      flash[:primary] = 'You\'ve already saved this product for later.'
    else
      current_user.products.push(product)
      flash[:success] = 'Product Saved for Later'
    end
    respond_to do |format|
      format.html { redirect_to products_path }
      format.js
    end
  end

  def show
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.new
    @review = Review.new
  end

  def checkout
    @order = current_order
    @order_items = current_order.order_items
  end

  def saved_for_later
    @saved = current_user.products
  end

  def remove_from_saved
    @saved_item = Product.find(params[:product_id])
    current_user.products.destroy(@saved_item)
    flash[:warning] = "Item has been removed."
    respond_to do |format|
      format.html {redirect_to saved_for_later_path}
      format.js
    end
  end
end
