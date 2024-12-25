class CreateCarParts < ActiveRecord::Migration[8.0]
  def change
    create_table :car_parts do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, null: false, precision: 10, scale: 2
      t.references :part_type, null: false, foreign_key: true
      t.references :seller, null: false, foreign_key: true
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
