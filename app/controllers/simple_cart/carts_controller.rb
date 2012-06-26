module SimpleCart
  class CartsController < ApplicationController

    before_filter :find_cart

    def show
      @cart_items = @cart.cart_items
    end

    def update
      respond_to do |format|
        if @cart.update_attributes(params[:simple_cart_cart])
          format.html{ redirect_to simple_cart_cart_path }
          format.json{ head :no_content }
        else
          format.html{ render :show }
          format.json{ render json: @cart.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def find_cart
      @cart = current_cart
    end
  end
end