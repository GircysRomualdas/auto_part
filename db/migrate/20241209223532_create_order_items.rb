class CreateOrderItems < ActiveRecord::Migration[8.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.references :order, foreign_key: true
      t.references :car_part, foreign_key: true

      t.timestamps
    end
  end
end
