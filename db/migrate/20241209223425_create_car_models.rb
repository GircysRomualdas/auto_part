class CreateCarModels < ActiveRecord::Migration[8.0]
  def change
    create_table :car_models do |t|
      t.string :model_name
      t.references :car_brand, foreign_key: true

      t.timestamps
    end
  end
end
