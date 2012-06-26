require 'spec_helper'

describe CartItemsController do
  describe "adding item to the cart" do
    it "should redirect to cart page" do
      Product.should_receive(:find_by_id).with("1").and_return(mock_model(Product, cartable_price: 15.0))
      post :create, :cartable_type =>  "product", :cartable_id => "1"
      response.should redirect_to(simple_cart_cart_path)
    end  
  end
end