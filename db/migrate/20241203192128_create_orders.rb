class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :order_status
      t.references :cart

      t.timestamps
    end
  end
end
