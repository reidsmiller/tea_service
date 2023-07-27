class Api::V0::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.create!(subscription_params)
    render json: SubscriptionSerializer.new(subscription), status: 201
  end

  def destroy
    subscription = Subscription.find(params[:id])
    subscription.update(status: 'cancelled')
    render json: SubscriptionSerializer.new(subscription), status: 200
  end

  private

  def subscription_params
    params.permit(:customer_id, :title, :price, :frequency, :tea_id)
  end
end