class CreateCarParts < ActiveRecord::Migration[8.0]
  def change
    create_table :car_parts do |t|
      t.string :part_name
      t.text :description
      t.decimal :price
      t.references :part_type, foreign_key: true
      t.references :car_model, foreign_key: true
      t.references :seller, foreign_key: true

      t.timestamps
    end
  end
end
