class ChangePriceToFloatInSubscriptions < ActiveRecord::Migration[7.0]
  def change
    remove_column :subscriptions, :price, :string
    add_column :subscriptions, :price, :float
  end
end
