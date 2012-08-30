require 'rails'

module SimpleCart

  mattr_accessor :current_shopper_method
  @@current_shopper_method = :current_user

  mattr_accessor :cartables
  @@cartables = []

  mattr_accessor :on_checkout_method
  @@on_checkout_method = nil

  mattr_accessor :on_failed_method
  @@on_failed_method = nil

  mattr_accessor :on_success_method
  @@on_success_method = nil

  mattr_accessor :on_expire_method
  @@on_expire_method = nil

  class << self
    def setup
      yield self
    end

    def routes(rails_router, params = {})
      params[:cart] ||= {}
      params[:cart].merge!(only: [:show, :update])
      params[:cart_items] ||= {}
      params[:cart_items].merge!(only: [:create, :destroy])
      rails_router.instance_exec(params) do |p|
        namespace :simple_cart do
          resource :cart, p[:cart]
          resources :cart_items, p[:cart_items]
        end
      end
    end
  end

end

require 'state_machine'
require 'simple_cart/extensions/active_record/base'
require 'simple_cart/extensions/action_controller/base'
require 'simple_cart/engine'