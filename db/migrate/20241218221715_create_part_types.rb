class CreatePartTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :part_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
