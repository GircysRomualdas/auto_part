class CreateOrderItems < ActiveRecord::Migration[8.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity

      t.references :car_part
      t.references :order

      t.timestamps
    end
  end
end
