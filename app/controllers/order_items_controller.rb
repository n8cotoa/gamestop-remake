class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @order.user_id = current_user
    @item = @order.order_items.new(item_params)
    @order.save
    if @order.save
      flash[:notice] = "Item added to cart."
      respond_to do |format|
        format.js
      end
    else
      flash[:alert] = "Please enter a quantity."
    end
    session[:order_id] = @order.id
  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    redirect_to cart_path
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
