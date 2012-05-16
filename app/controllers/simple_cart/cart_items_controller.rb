module SimpleCart

  class CartItemsController < ApplicationController

    before_filter :find_cart_item, :only => [:update, :destroy]

    def create
      @cart_item = current_cart.add_item(find_cartable)
      respond_to do |format|
        format.html do
          redirect_to simple_cart_cart_path
        end
      end
    end

    def destroy
      if @cart_item.destroy
        flash[:notice] = "Cart item removed"
      else
        flash[:notice] = "Failed"
      end
      redirect_to simple_cart_cart_path
    end
    
    private
  
    def find_cart_item
      @cart_item = current_cart.cart_items.find(params[:id])
    end
  end
end