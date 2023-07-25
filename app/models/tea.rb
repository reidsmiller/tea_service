class Tea < ApplicationRecord
  validates_presence_of :title, :description, :temperature, :brew_time
  validates_numericality_of :temperature, :brew_time

  has_many :subscription_teas
  has_many :subscriptions, through: :subscription_teas
end
