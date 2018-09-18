class OrderItemsController < ApplicationController

  def create
    @order = current_order
    if current_user
      @order.user_id = current_user.id
    end
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
    respond_to do |format|
      format.html { redirect_to cart_path }
      format.js
    end
    @order.save
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
