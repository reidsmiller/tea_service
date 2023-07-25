class SubscriptionTea < ApplicationRecord
  validates_presence_of :subscription_id, :tea_id

  belongs_to :subscription
  belongs_to :tea
end
