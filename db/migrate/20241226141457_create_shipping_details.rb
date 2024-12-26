class CreateShippingDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :shipping_details do |t|
      t.references :order, null: false, foreign_key: true
      t.string :recipient_name
      t.string :recipient_email
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :phone_number

      t.timestamps
    end
  end
end
