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

  def self.setup
    yield self
  end

end

require 'state_machine'
require 'simple_cart/extensions/active_record/base'
require 'simple_cart/extensions/action_controller/base'
require 'simple_cart/engine'