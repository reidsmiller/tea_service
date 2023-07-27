class Api::V0::SubscriptionController < ApplicationController
  def create
    Subscription.create!(subscription_params)
    
  end

  private

  def subscription_params
    params.permit(:title, :price, :frequency, :customer_id, :tea_id)
  end
end