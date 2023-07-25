class CreateCustomerTeas < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_teas do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :tea, null: false, foreign_key: true

      t.timestamps
    end
  end
end
