class CreateCarModels < ActiveRecord::Migration[8.0]
  def change
    create_table :car_models do |t|
      t.string :name

      t.references :car_brand

      t.timestamps
    end
  end
end
