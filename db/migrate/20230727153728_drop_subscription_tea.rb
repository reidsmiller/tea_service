class DropSubscriptionTea < ActiveRecord::Migration[7.0]
  def change
    drop_table :subscription_teas
  end
end
