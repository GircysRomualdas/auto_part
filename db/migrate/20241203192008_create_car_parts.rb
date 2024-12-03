class CreateCarParts < ActiveRecord::Migration[8.0]
  def change
    create_table :car_parts do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.integer :quantity

      t.references :car_model
      t.references :part_type
      t.references :seller

      t.timestamps
    end
  end
end
