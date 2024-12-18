class CreateCarParts < ActiveRecord::Migration[8.0]
  def change
    create_table :car_parts do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.references :part_type, null: false, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
